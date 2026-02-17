# 🚀 Serverless E-Commerce Platform | AWS

<p align="center">
  <img src="https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white" />
  <img src="https://img.shields.io/badge/Lambda-FF9900?style=for-the-badge&logo=aws-lambda&logoColor=white" />
  <img src="https://img.shields.io/badge/API_Gateway-FF4F8B?style=for-the-badge&logo=amazon-api-gateway&logoColor=white" />
  <img src="https://img.shields.io/badge/DynamoDB-4053D6?style=for-the-badge&logo=amazon-dynamodb&logoColor=white" />
  <img src="https://img.shields.io/badge/S3-569A31?style=for-the-badge&logo=amazon-s3&logoColor=white" />
  <img src="https://img.shields.io/badge/CloudFront-FF9900?style=for-the-badge&logo=amazon-cloudfront&logoColor=white" />
  <img src="https://img.shields.io/badge/SNS-FF4F8B?style=for-the-badge&logo=amazon-sns&logoColor=white" />
  <img src="https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=react&logoColor=black" />
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" />
</p>

---

## 📋 Project Overview

A **production-ready serverless e-commerce platform** designed to handle **flash sale traffic spikes** (Diwali, Black Friday, Amazon Prime Day).

### 🎯 Problem It Solves
Traditional e-commerce websites often crash during flash sales due to sudden traffic spikes.  
This serverless solution **auto-scales automatically** and **costs nothing when idle**.

### ✅ Key Achievements
- ⏱️ Built in just 1 day
- 💰 Runs within AWS Free Tier
- 📈 Auto-scales with traffic
- 📧 Real-time email notifications
- 🔒 Secure IAM-based architecture

---

## 🏗️ Architecture

<p align="center">
  <img src="architecture-dark.png" width="700"/>
</p>

### 📊 Data Flow
1. User visits website → CloudFront serves React app from S3  
2. User browses products → API Gateway → `get-products` Lambda → DynamoDB  
3. User places order → API Gateway → `place-order` Lambda → DynamoDB → SNS  
4. SNS sends order confirmation email  

---

## ✨ Features

### 🛍️ User Experience
| Feature | Description |
|---------|-------------|
| Product Catalog | Browse products with real-time inventory |
| Order Placement | Place orders with quantity selection |
| Email Notifications | Automatic order confirmation via SNS |
| Responsive Design | Mobile-friendly React frontend |
| Fast Loading | CloudFront CDN for low latency |

### ⚙️ Technical Features
| Feature | Description |
|---------|-------------|
| Serverless Architecture | No servers to manage |
| Auto-scaling | Handles traffic spikes automatically |
| Secure IAM Setup | Least-privilege access control |
| Global CDN | CloudFront edge delivery |
| Cost Optimized | Free-tier friendly design |
| Observability | CloudWatch logs and metrics |
| Infrastructure as Code | CloudFormation templates |

---

## 🛠️ Tech Stack

### ☁️ AWS Services
| Service | Purpose |
|---------|--------|
| Lambda | Backend compute |
| API Gateway | REST endpoints |
| DynamoDB | NoSQL database |
| S3 | Static frontend hosting |
| CloudFront | Global CDN |
| SNS | Email notifications |
| IAM | Security & permissions |
| CloudWatch | Logging & monitoring |
| CloudFormation | Infrastructure as Code |

### 🎨 Frontend
- React 18
- JavaScript (ES6+)
- HTML5 / CSS3
- Axios
- Vite

### 🐍 Backend
- Python 3.9
- boto3 (AWS SDK)
- UUID
- Datetime
- JSON

---

## 📊 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/products` | Get all products |
| POST | `/orders` | Place new order |

### Sample API Calls
```bash
# Get all products
curl https://xbnff4ak5e.execute-api.us-east-1.amazonaws.com/prod/products

# Place an order
curl -X POST https://xbnff4ak5e.execute-api.us-east-1.amazonaws.com/prod/orders \
  -H "Content-Type: application/json" \
  -d '{"userId":"user123","productId":"61f46829-1e8a-46d2-8322-b0a7b4a94a25","quantity":2}'
