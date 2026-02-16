# 🚀 Serverless E-Commerce Platform – Flash Sale Handler

<p align="center">
  <img src="https://img.shields.io/badge/AWS%20Lambda-FF9900?style=for-the-badge&logo=aws-lambda&logoColor=white" alt="AWS Lambda"/>
  <img src="https://img.shields.io/badge/API%20Gateway-FF4F8B?style=for-the-badge&logo=amazon-api-gateway&logoColor=white" alt="API Gateway"/>
  <img src="https://img.shields.io/badge/DynamoDB-4053D6?style=for-the-badge&logo=amazon-dynamodb&logoColor=white" alt="DynamoDB"/>
  <img src="https://img.shields.io/badge/S3-569A31?style=for-the-badge&logo=amazon-s3&logoColor=white" alt="S3"/>
  <img src="https://img.shields.io/badge/CloudFront-FF9900?style=for-the-badge&logo=amazon-cloudfront&logoColor=white" alt="CloudFront"/>
  <img src="https://img.shields.io/badge/SNS-FF4F8B?style=for-the-badge&logo=amazon-sns&logoColor=white" alt="SNS"/>
  <img src="https://img.shields.io/badge/IAM-FF9900?style=for-the-badge&logo=amazon-iam&logoColor=white" alt="IAM"/>
  <img src="https://img.shields.io/badge/CloudFormation-FF9900?style=for-the-badge&logo=amazon-cloudformation&logoColor=white" alt="CloudFormation"/>
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
</p>

---

## 📌 **Project Overview**

A **production-ready serverless e-commerce platform** designed to handle **flash sale traffic spikes** (Diwali, Black Friday, Amazon Prime Day) with **zero server management** and **automatic scaling**.

✅ Built in **1 day**  
✅ **Zero cost** (AWS Free Tier)  
✅ **10-minute deployment**  
✅ **GitHub Actions CI/CD**  
✅ **Fully serverless**  

---

## 🏗️ **Architecture**
┌──────────────────────────────────────────────────────────┐
│ CloudFront CDN │
│ d36m941u6p5v16.cloudfront.net │
└──────────────────────────┬───────────────────────────────┘
│
▼
┌──────────────────────────────────────────────────────────┐
│ S3 Bucket (React Frontend) │
│ flashsale-frontend-682366719001 │
└──────────────────────────┬───────────────────────────────┘
│ (API Calls)
▼
┌──────────────────────────────────────────────────────────┐
│ API Gateway │
│ https://xbnff4ak5e.execute-api... │
├──────────────────────────────────────────────────────────┤
│ ┌──────────────┐ ┌──────────────┐ │
│ │ GET /products│ │ POST /orders │ │
│ └──────┬───────┘ └──────┬───────┘ │
└─────────┼─────────────────────────┼───────────────────────┘
│ │
▼ ▼
┌─────────────────┐ ┌─────────────────────────┐
│ Lambda │ │ Lambda │
│ get-products │ │ place-order │
└────────┬────────┘ └───────────┬─────────────┘
│ │
▼ ▼
┌─────────────────┐ ┌─────────────────────────┐
│ DynamoDB │ │ DynamoDB │
│ Products │ │ Orders │
└─────────────────┘ └───────────┬─────────────┘
│
▼
┌─────────────────┐
│ SNS │
│ Notifications │
└────────┬────────┘
│
▼
┌─────────────────┐
│ Email │
│ Confirmation │
└─────────────────┘

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
🎉 Order Placed Successfully!

━━━━━━━━━━━━━━━━━━━━━━━
👤 Customer: Vaibhav Sudrik
📧 Email: vaibhav@example.com
📦 Product: Running Shoes
🔢 Quantity: 2
💰 Total: ₹2598
📌 Order ID: 1bc33291-bfd4-425b-94ff-6ecd3e03baf1
━━━━━━━━━━━━━━━━━━━━━━━
Thank you for shopping with us! 🛍️

---

## 🚀 **10-Minute Deployment**

```bash
# 1. Clone repository
git clone https://github.com/vaibhav343343/serverless-ecommerce-aws.git
cd serverless-ecommerce-aws

# 2. Setup Python environment
python3 -m venv venv
source venv/bin/activate
pip install boto3

# 3. Deploy infrastructure (CloudFormation)
aws cloudformation deploy \
  --template-file template.yaml \
  --stack-name ecommerce-stack \
  --capabilities CAPABILITY_IAM

# 4. Build and deploy frontend
cd frontend
npm install
npm run build
aws s3 sync dist/ s3://flashsale-frontend-682366719001/ --delete

# 5. Clear CloudFront cache
aws cloudfront create-invalidation \
  --distribution-id EM10UTSO02LNZ \
  --paths "/*"

# 6. Seed products database
python3 scripts/seed-products.py

# ✅ Done! Your app is live at:
echo "https://d36m941u6p5v16.cloudfront.net"
🔄 CI/CD Pipeline (GitHub Actions)
Push to main branch automatically:

✅ Deploys Lambda functions

✅ Builds React frontend

✅ Syncs to S3

✅ Invalidates CloudFront cache
name: Deploy to AWS
on:
  push:
    branches: [ main ]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: |
          # Deployment commands
💰 Cost Analysis (AWS Free Tier)
Service	Free Tier Limit	Estimated Usage	Cost
Lambda	1M requests/month	~10,000	$0
API Gateway	1M calls/month	~5,000	$0
DynamoDB	25GB storage	~100MB	$0
S3	5GB storage	~100MB	$0
CloudFront	1TB transfer	~100MB	$0
SNS	1M publishes	~1,000	$0
CloudWatch	5GB logs	~100MB	$0
TOTAL			$0.00/

📚 Key Learnings
✅ Serverless Architecture – Event-driven, auto-scaling

✅ AWS Services – Lambda, API Gateway, DynamoDB, S3, CloudFront, SNS, IAM

✅ Infrastructure as Code – CloudFormation templates

✅ CI/CD – GitHub Actions automated deployments

✅ Security – IAM roles, OAC, bucket policies

✅ Cost Optimization – 100% within free tier

✅ Monitoring – CloudWatch, X-Ray tracing

✅ Frontend Integration – React with AWS backen

🚀 Future Enhancements
Add user authentication (Cognito)

Implement payment gateway (Stripe)

Add order tracking with Step Functions

Multi-region deployment for disaster recovery

GraphQL API with AppSync

Add WebSockets for real-time updates

👨‍💻 Author
Vaibhav Sudrik
🎓 Final Year – Cloud Computing Engineering

📧 Email: vaibhavsudrik2005@gmail.com
🔗 LinkedIn: www.linkedin.com/in/vaibhav-sudrik-aa59ab34
🐙 GitHub: github.com/vaibhav343343


