#!/usr/bin/env python3
import boto3
import uuid

dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
table = dynamodb.Table('Products')

products = [
    {
        'productId': str(uuid.uuid4()),
        'name': 'Classic White T-Shirt',
        'description': '100% cotton, comfortable fit',
        'price': 499,
        'category': 'clothing',
        'imageUrl': 'https://via.placeholder.com/300',
        'inStock': 100
    },
    {
        'productId': str(uuid.uuid4()),
        'name': 'Running Shoes',
        'description': 'Lightweight, breathable running shoes',
        'price': 1299,
        'category': 'footwear',
        'imageUrl': 'https://via.placeholder.com/300',
        'inStock': 50
    },
    {
        'productId': str(uuid.uuid4()),
        'name': 'Wireless Headphones',
        'description': 'Bluetooth 5.0, 20hr battery life',
        'price': 1999,
        'category': 'electronics',
        'imageUrl': 'https://via.placeholder.com/300',
        'inStock': 30
    }
]

for product in products:
    table.put_item(Item=product)
    print(f"✅ Added: {product['name']}")

print(f"\n🎉 {len(products)} products added successfully!")
