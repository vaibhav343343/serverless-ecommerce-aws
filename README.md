# 🚀 Serverless E-Commerce Platform | AWS | React | Python

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

## 📋 **Project Overview**

A **production-ready serverless e-commerce platform** designed to handle **flash sale traffic spikes** (Diwali, Black Friday, Amazon Prime Day). 

### 🎯 Problem It Solves
Traditional e-commerce websites crash during flash sales due to sudden traffic spikes. This serverless solution **auto-scales infinitely** and **costs zero** when not in use.

### ✅ Key Achievements
- ⏱️ **Built in just 1 day** — Demonstrates rapid learning & execution
- 💰 **Zero cost operation** — 100% within AWS Free Tier
- 📈 **Handles thousands of concurrent users** — Auto-scales automatically
- 📧 **Real-time email notifications** — Professional user experience
- 🔒 **Enterprise-grade security** — IAM roles, OAC, bucket policies

---

## 🏗️ Architecture
<img width="1024" height="1230" alt="ChatGPT Image Feb 17, 2026, 02_46_33 PM" src="https://github.com/user-attachments/assets/54e9f76b-5bd9-4dbc-8614-fcf584d9b60f" />

### 📊 Data Flow
1. **User visits website** → CloudFront serves React app from S3
2. **User browses products** → API Gateway calls `get-products` Lambda → Fetches from DynamoDB
3. **User places order** → API Gateway calls `place-order` Lambda → Saves to DynamoDB → Triggers SNS
4. **Customer receives email** → SNS sends order confirmation with details

---

## ✨ Features That Impress Recruiters

### 🛍️ User Experience
| Feature | Description |
|---------|-------------|
| **📱 Product Catalog** | Browse products with real-time inventory |
| **🛒 Order Placement** | Place orders with quantity selection |
| **📧 Email Notifications** | Automatic order confirmation via SNS |
| **🎨 Responsive Design** | Mobile-friendly React frontend |
| **⚡ Fast Loading** | CloudFront CDN for global low-latency |

### ⚙️ Technical Excellence
| Feature | Description |
|---------|-------------|
| **⚡ Serverless** | Zero servers to manage — AWS Lambda handles everything |
| **📈 Auto-scaling** | Handles any traffic spike automatically |
| **🔒 Enterprise Security** | IAM roles + Origin Access Control + Bucket Policies |
| **🌍 Global CDN** | CloudFront edge locations worldwide |
| **💰 Cost Optimized** | 100% within AWS Free Tier — $0/month |
| **📊 Full Observability** | CloudWatch logs + X-Ray tracing |
| **🔧 Infrastructure as Code** | CloudFormation templates for repeatable deployments |

---

## 🛠️ Complete Tech Stack

### ☁️ AWS Services (8+ Services)
| Service | Purpose | Why It Matters |
|---------|---------|----------------|
| **Lambda** | Python backend for products & orders | Serverless compute |
| **API Gateway** | REST API endpoints | API management |
| **DynamoDB** | NoSQL database | Single-digit millisecond latency |
| **S3** | React frontend hosting | 99.999999999% durability |
| **CloudFront** | Global CDN | 400+ edge locations |
| **SNS** | Email notifications | Event-driven architecture |
| **IAM** | Security & access control | Least privilege principle |
| **CloudWatch** | Logging & monitoring | Full observability |
| **CloudFormation** | Infrastructure as Code | Repeatable deployments |

### 🎨 **Frontend**
- **React 18** — Modern UI development
- **JavaScript (ES6+)** — Latest language features
- **HTML5/CSS3** — Responsive design
- **Axios** — Promise-based HTTP client
- **Vite** — Lightning-fast builds

### 🐍 **Backend**
- **Python 3.9** — Lambda runtime
- **boto3** — AWS SDK for Python
- **UUID** — Unique order ID generation
- **Datetime** — Timestamp handling
- **JSON** — Data interchange format

---

## 📊 **API Endpoints & Testing**

### **REST API**
| Method | Endpoint | Description | Request Body |
|--------|----------|-------------|--------------|
| `GET` | `/products` | Get all products | — |
| `POST` | `/orders` | Place new order | `{ "userId": "string", "productId": "string", "quantity": number }` |

### **Sample API Calls**
```bash
# Get all products
curl https://xbnff4ak5e.execute-api.us-east-1.amazonaws.com/prod/products

# Place an order
curl -X POST https://xbnff4ak5e.execute-api.us-east-1.amazonaws.com/prod/orders \
  -H "Content-Type: application/json" \
  -d '{"userId":"user123","productId":"61f46829-1e8a-46d2-8322-b0a7b4a94a25","quantity":2}'
  ```

---
📧 Email Notification (SNS)
🎉 Order Confirmed!

📋 ORDER DETAILS

👤 Customer: Rahul Sharma
📦 Product: Running Shoes
🔢 Quantity: 2
💰 Total: ₹2598
📌 Order ID: 1bc33291-bfd4-425b-94ff-6ecd3e03baf1
📊 Status: PENDING

Thank you for shopping with us! 🛍️


---
🚀 5-Minute Deployment Guide
Prerequisites
AWS Account (Free Tier)
AWS CLI configured (aws configure)
Node.js & npm installed
Python 3.9+ installed

---
Step-by-Step Deployment
**# 1. Clone the repository**
git clone https://github.com/vaibhav343343/serverless-ecommerce-aws.git
cd serverless-ecommerce-aws

### 2. Setup Python virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install boto3

### 3. Deploy backend infrastructure (CloudFormation)
aws cloudformation deploy \
  --template-file template.yaml \
  --stack-name ecommerce-stack \
  --capabilities CAPABILITY_IAM

### 4. Build and deploy frontend
cd frontend
npm install
npm run build
aws s3 mb s3://your-unique-bucket-name
aws s3 website s3://your-unique-bucket-name --index-document index.html
aws s3 sync dist/ s3://your-unique-bucket-name/ --delete

### 5. Seed products database
cd ..
python3 scripts/seed-products.py

### 6. Get your live URLs
echo "✅ Frontend URL: http://your-unique-bucket-name.s3-website-us-east-1.amazonaws.com"
echo "✅ API URL: https://xbnff4ak5e.execute-api.us-east-1.amazonaws.com/prod"

---

### 📁 Project Structure
serverless-ecommerce-python/
├── 📂 frontend/                 # React application
│   ├── 📂 src/                  # React components
│   ├── 📂 public/               # Static assets
│   └── 📄 package.json          # Dependencies
├── 📂 backend/                  # Lambda functions
│   ├── 📂 get-products/         # Product listing Lambda
│   │   └── 📄 lambda_function.py
│   └── 📂 place-order/          # Order processing Lambda
│       └── 📄 lambda_function.py
├── 📂 scripts/                  # Utility scripts
│   └── 📄 seed-products.py      # Seed products into DynamoDB
├── 📄 template.yaml              # CloudFormation template
├── 📄 cleanup-all.sh             # One-click cleanup script
└── 📄 README.md                  # You're here!

---
**👨‍💻 Author**

Vaibhav Sudrik
Cloud Computing Student
Email: vaibhavsudrik2005@gmail.com
LinkedIn: www.linkedin.com/in/vaibhav-sudrik-aa59ab34
GitHub: github.com/vaibhav343343

---
📝 License
This project is licensed under the MIT License — free for personal and commercial use.

---
**🏆 Final Words**
<div align="center"> <h3>⚡ Built in 1 Day | ☁️ 100% Serverless | 💰 Zero Cost | 🔥 Interview Ready</h3> <p>This project demonstrates production-ready AWS skills, full-stack development, and the ability to deliver quickly.</p> <p><i>"I don't just learn cloud — I build with it."</i></p> <br> <sub>© 2026 Vaibhav. All Rights Reserved.</sub> </div> ```
