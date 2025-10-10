# Board Game Listing Web App – AWS ECS Deployment

## Project Overview
This project demonstrates a **full end-to-end CI/CD deployment** of a Dockerized Java Maven web application on **AWS ECS Fargate** with an **Application Load Balancer (ALB)** and **CloudWatch monitoring**.

**Key Features:**
- Containerized Java Maven app
- CI/CD pipeline using **GitHub Actions**
- Docker image stored in **AWS ECR**
- Deployment to **ECS Fargate**
- ALB for stable access
- Security scanning using **Trivy**
- Logs and metrics in **CloudWatch**

---

## Architecture

GitHub → CI/CD → ECR → ECS → ALB → CloudWatch Logs/Metrics

## Deployment Steps

### 1. Dockerize the App
- Built using Maven:
```bash
mvn clean package
docker build -t boardgame-app .
```
### 2. Push to ECR
```bash
docker tag boardgame-app:latest <AWS_ACCOUNT_ID>.dkr.ecr.<region>.amazonaws.com/boardgame-app:latest
docker push <AWS_ACCOUNT_ID>.dkr.ecr.<region>.amazonaws.com/boardgame-app:latest
```
### 3. ECS Deployment

ECS cluster and service running Fargate tasks.

ALB forwards HTTP requests to the tasks.

Task definition configured with logging to CloudWatch.

### 4. CI/CD Pipeline

GitHub Actions automatically:

Builds Maven project

Runs OWASP dependency-check

Builds Docker image

Scans image with Trivy

Pushes image to ECR

Updates ECS service

### Cloud Monitoring 

CloudWatch Logs: /ecs/boardgame-task

CloudWatch Metrics: ECS CPU, Memory usage, task count

ALB Target Group: Shows healthy tasks

### Screenshots

GitHub Actions Workflow

<img width="1880" height="825" alt="Screenshot 2025-10-11 011309" src="https://github.com/user-attachments/assets/e54e5760-f620-4fd6-9cdb-5bfd4cdeb27a" />



ECR Repository (Image Tags)

<img width="1470" height="326" alt="Screenshot 2025-10-11 011441" src="https://github.com/user-attachments/assets/101361fb-9c4a-44c0-95a0-89a837e036e3" />



ECS Cluster & Running Tasks

<img width="1902" height="689" alt="Screenshot 2025-10-11 011807" src="https://github.com/user-attachments/assets/483ae6b3-8fb5-447d-9cab-11e82a18130c" />



ECS Task Definition

<img width="1904" height="841" alt="Screenshot 2025-10-11 012114" src="https://github.com/user-attachments/assets/4f455674-e5df-41f0-a7f2-2a5e3ff320a6" />



ALB Target Group & Health

<img width="1190" height="280" alt="Screenshot 2025-10-11 012329" src="https://github.com/user-attachments/assets/e33140ea-46fc-48ec-b65e-4899b4ca82ab" />



CloudWatch Logs

<img width="1737" height="818" alt="Screenshot 2025-10-11 012519" src="https://github.com/user-attachments/assets/793ef8cc-191d-45ee-91c4-db87091aad58" />



CloudWatch Metrics

<img width="1919" height="806" alt="Screenshot 2025-10-11 012749" src="https://github.com/user-attachments/assets/34cb0906-392e-4b8e-92ce-2b21a265b6dc" />



Application Running via ALB

<img width="1891" height="959" alt="Screenshot 2025-10-11 012405" src="https://github.com/user-attachments/assets/90a0350d-f1e5-4954-ab04-4d623fdbba2e" />

### Access Application
http://<your-alb-dns-name>.ap-south-1.elb.amazonaws.com

### Skills Demonstrated

Docker & Containerization

AWS ECR, ECS, Fargate, ALB

GitHub Actions CI/CD Pipeline

CloudWatch Metrics & Logs

Security Scanning (Trivy, OWASP Dependency Check)

Infrastructure as Code (Terraform Integration)

Author

Riddhesh Sutar
GitHub: https://github.com/riddheshsutar

LinkedIn: https://www.linkedin.com/in/sutarriddhesh22/
