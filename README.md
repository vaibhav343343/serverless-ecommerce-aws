# 🚀 Serverless E-Commerce Platform – Flash Sale Handler

<p align="center">
  <img src="https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white" alt="AWS"/>
  <img src="https://img.shields.io/badge/Serverless-black?style=for-the-badge&logo=serverless" alt="Serverless"/>
  <img src="https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54" alt="Python"/>
  <img src="https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB" alt="React"/>
  <img src="https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white" alt="GitHub Actions"/>
  <img src="https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform"/>
</p>

---

## 📋 **Project Overview**

A **production-ready serverless e-commerce platform** designed to handle **flash sale traffic spikes** (Diwali, Black Friday, Amazon Prime Day) with **zero server management** and **automatic scaling**.

### ✅ Key Highlights
- 💰 **Zero cost** (AWS Free Tier)
- 🔄 **GitHub Actions CI/CD**
- ⚡ **Fully serverless**
- 📈 **Auto-scales to thousands of requests**

---

## 🏗️ **Architecture Diagram**

---

## ✨ **Features**

### 🛍️ **User Features**
- ✅ Browse products with real-time inventory
- ✅ Place orders with quantity selection
- ✅ Automatic email confirmation
- ✅ Responsive React frontend

### ⚙️ **Technical Features**
- ⚡ **Serverless** – Zero servers to manage
- 📈 **Auto-scaling** – Handles any traffic spike
- 🔒 **Secure** – IAM roles + OAC + Bucket Policies
- 🚀 **Fast** – CloudFront CDN globally
- 💰 **Cost-effective** – Pay only for usage (free tier)
- 🔄 **CI/CD** – GitHub Actions auto-deploy
- 📊 **Monitoring** – CloudWatch + X-Ray tracing

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
| **Monitoring** | CloudWatch + X-Ray | Logs & tracing |

---

## 📊 **API Endpoints**

| Method | Endpoint | Description | Request Body |
|--------|----------|-------------|--------------|
| `GET` | `/products` | Get all products | – |
| `POST` | `/orders` | Place new order | `{ "userId": "user123", "productId": "123", "quantity": 2 }` |

---

## 📧 **Sample Email Notification**
---
🎉 Order Placed Successfully!
━━━━━━━━━━━━━━━━━━━━━━━
👤 Customer: Rahul Sharma
📧 Email: rahul@example.com
📦 Product: Running Shoes
🔢 Quantity: 2
💰 Total: ₹2598
📌 Order ID: 1bc33291-bfd4-425b-94ff-6ecd3e03baf1
