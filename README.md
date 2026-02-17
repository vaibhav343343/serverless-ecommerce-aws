🚀 Serverless E-Commerce Platform – Flash Sale Handler
<p align="center"> <img src="https://img.shields.io/badge/AWS%20Lambda-FF9900?style=for-the-badge&logo=aws-lambda&logoColor=white"/> <img src="https://img.shields.io/badge/API%20Gateway-FF4F8B?style=for-the-badge&logo=amazon-api-gateway&logoColor=white"/> <img src="https://img.shields.io/badge/DynamoDB-4053D6?style=for-the-badge&logo=amazon-dynamodb&logoColor=white"/> <img src="https://img.shields.io/badge/S3-569A31?style=for-the-badge&logo=amazon-s3&logoColor=white"/> <img src="https://img.shields.io/badge/CloudFront-FF9900?style=for-the-badge&logo=amazon-cloudfront&logoColor=white"/> <img src="https://img.shields.io/badge/SNS-FF4F8B?style=for-the-badge&logo=amazon-sns&logoColor=white"/> <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/> </p>
---
## 📋 **Project Overview**

A production-ready serverless e-commerce platform built to handle **flash sale traffic spikes** (Diwali, Black Friday, Amazon Prime Day). Automatically scales from 0 to thousands of requests without any server management.
---
<p align="center"> <img src="architecture-dark.png" alt="Serverless Architecture Diagram" width="700"/> </p>
---

## 🛠️ **Tech Stack**

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Frontend** | React + Vite | User interface |
| **Hosting** | S3 + CloudFront | Global CDN |
| **API Layer** | API Gateway | REST endpoints |
| **Business Logic** | Lambda (Python) | Serverless compute |
| **Database** | DynamoDB | NoSQL storage |
| **Notifications** | SNS | Email alerts |
| **CI/CD** | GitHub Actions | Auto-deployment |
| **Infrastructure** | AWS CLI + CloudFormation | IaC |

---

## 📊 **API Endpoints**

| Method | Endpoint | Description | Request Body |
|--------|----------|-------------|--------------|
| `GET` | `/products` | Get all products | - |
| `POST` | `/orders` | Place new order | `{ "userId": "user123", "productId": "123", "quantity": 2 }` |

---

## 📧 **Sample Email Notification**
