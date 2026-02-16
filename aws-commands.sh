#!/bin/bash

# 🚀 AWS INFRASTRUCTURE COMMANDS
# Project: Serverless E-Commerce
# Date: 16-Feb-2026

echo "========================================"
echo "DYNAMODB TABLES"
echo "========================================"

# Products Table
aws dynamodb create-table \
  --table-name Products \
  --attribute-definitions AttributeName=productId,AttributeType=S \
  --key-schema AttributeName=productId,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region us-east-1

# Orders Table
aws dynamodb create-table \
  --table-name Orders \
  --attribute-definitions \
    AttributeName=orderId,AttributeType=S \
    AttributeName=userId,AttributeType=S \
    AttributeName=createdAt,AttributeType=S \
  --key-schema AttributeName=orderId,KeyType=HASH \
  --global-secondary-indexes \
    "[{\"IndexName\":\"UserOrdersIndex\",\"KeySchema\":[{\"AttributeName\":\"userId\",\"KeyType\":\"HASH\"},{\"AttributeName\":\"createdAt\",\"KeyType\":\"RANGE\"}],\"Projection\":{\"ProjectionType\":\"ALL\"}}]" \
  --billing-mode PAY_PER_REQUEST \
  --region us-east-1

# Users Table (if created)
aws dynamodb create-table \
  --table-name Users \
  --attribute-definitions AttributeName=userId,AttributeType=S \
  --key-schema AttributeName=userId,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region us-east-1

echo "========================================"
echo "LAMBDA FUNCTIONS"
echo "========================================"

# get-products Lambda
cd ~/serverless-ecommerce-python/backend/get-products
zip -r function.zip lambda_function.py

aws lambda create-function \
  --function-name get-products \
  --runtime python3.9 \
  --role arn:aws:iam::682366719001:role/lambda-products-role \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://function.zip \
  --environment Variables={PRODUCTS_TABLE=Products} \
  --region us-east-1

# place-order Lambda
cd ~/serverless-ecommerce-python/backend/place-order
zip -r function.zip lambda_function.py

aws lambda create-function \
  --function-name place-order \
  --runtime python3.9 \
  --role arn:aws:iam::682366719001:role/place-order-role \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://function.zip \
  --environment Variables={ORDERS_TABLE=Orders,PRODUCTS_TABLE=Products} \
  --region us-east-1

echo "========================================"
echo "API GATEWAY"
echo "========================================"

# API Gateway Create
aws apigateway create-rest-api \
  --name "Products API" \
  --region us-east-1

# GET /products
aws apigateway create-resource \
  --rest-api-id xbnff4ak5e \
  --parent-id j7k2lg4vq3 \
  --path-part products \
  --region us-east-1

aws apigateway put-method \
  --rest-api-id xbnff4ak5e \
  --resource-id wsgj5q \
  --http-method GET \
  --authorization-type NONE \
  --region us-east-1

aws apigateway put-integration \
  --rest-api-id xbnff4ak5e \
  --resource-id wsgj5q \
  --http-method GET \
  --type AWS_PROXY \
  --integration-http-method POST \
  --uri arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:682366719001:function:get-products/invocations \
  --region us-east-1

# POST /orders
aws apigateway create-resource \
  --rest-api-id xbnff4ak5e \
  --parent-id j7k2lg4vq3 \
  --path-part orders \
  --region us-east-1

aws apigateway put-method \
  --rest-api-id xbnff4ak5e \
  --resource-id auljjm \
  --http-method POST \
  --authorization-type NONE \
  --region us-east-1

aws apigateway put-integration \
  --rest-api-id xbnff4ak5e \
  --resource-id auljjm \
  --http-method POST \
  --type AWS_PROXY \
  --integration-http-method POST \
  --uri arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:682366719001:function:place-order/invocations \
  --region us-east-1

# Deploy API
aws apigateway create-deployment \
  --rest-api-id xbnff4ak5e \
  --stage-name prod \
  --region us-east-1

echo "========================================"
echo "SNS TOPIC"
echo "========================================"

aws sns create-topic --name order-notifications --region us-east-1

aws sns subscribe \
  --protocol email \
  --topic-arn arn:aws:sns:us-east-1:682366719001:order-notifications \
  --notification-endpoint your-email@example.com

echo "========================================"
echo "IAM ROLES"
echo "========================================"

# Lambda Products Role
aws iam create-role \
  --role-name lambda-products-role \
  --assume-role-policy-document file://backend/trust-policy.json

aws iam attach-role-policy \
  --role-name lambda-products-role \
  --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

aws iam attach-role-policy \
  --role-name lambda-products-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess

# Place Order Role
aws iam create-role \
  --role-name place-order-role \
  --assume-role-policy-document file://backend/trust-policy.json

aws iam attach-role-policy \
  --role-name place-order-role \
  --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

aws iam attach-role-policy \
  --role-name place-order-role \
  --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess

echo "========================================"
echo "✅ ALL COMMANDS SAVED"
echo "========================================"
