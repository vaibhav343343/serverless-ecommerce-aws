import json
import boto3
import uuid
import os
from datetime import datetime
from decimal import Decimal

dynamodb = boto3.resource('dynamodb')
orders_table = dynamodb.Table(os.environ.get('ORDERS_TABLE', 'Orders'))
products_table = dynamodb.Table(os.environ.get('PRODUCTS_TABLE', 'Products'))

class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return float(obj)
        return super().default(obj)

def lambda_handler(event, context):
    try:
        print(f"Event: {json.dumps(event)}")
        
        # Parse request body
        if isinstance(event.get('body'), str):
            body = json.loads(event['body'])
        else:
            body = event.get('body', {})
        
        # Validate required fields
        required = ['userId', 'productId', 'quantity']
        for field in required:
            if field not in body:
                return {
                    'statusCode': 400,
                    'headers': {
                        'Content-Type': 'application/json',
                        'Access-Control-Allow-Origin': '*'
                    },
                    'body': json.dumps({
                        'error': f'Missing required field: {field}'
                    })
                }
        
        # Get product details
        product_response = products_table.get_item(
            Key={'productId': body['productId']}
        )
        
        if 'Item' not in product_response:
            return {
                'statusCode': 404,
                'headers': {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*'
                },
                'body': json.dumps({
                    'error': 'Product not found'
                })
            }
        
        product = product_response['Item']
        
        # IMPORTANT FIX: Convert price to Decimal, not float
        price = Decimal(str(product['price'])) if isinstance(product['price'], (int, float)) else product['price']
        total_amount = price * int(body['quantity'])
        
        # Create order
        order_id = str(uuid.uuid4())
        order = {
            'orderId': order_id,
            'userId': body['userId'],
            'productId': body['productId'],
            'productName': product['name'],
            'quantity': int(body['quantity']),
            'unitPrice': price,
            'totalAmount': total_amount,
            'status': 'PENDING',
            'createdAt': datetime.utcnow().isoformat(),
            'updatedAt': datetime.utcnow().isoformat()
        }
        
        # Save to DynamoDB
        orders_table.put_item(Item=order)
        print(f"✅ Order saved: {order_id}")
        
        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({
                'message': 'Order placed successfully',
                'orderId': order_id,
                'status': 'PENDING',
                'totalAmount': float(total_amount)  # Convert for JSON response
            }, cls=DecimalEncoder)
        }
        
    except Exception as e:
        print(f"❌ Error: {str(e)}")
        return {
            'statusCode': 500,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({
                'error': str(e)
            })
        }
