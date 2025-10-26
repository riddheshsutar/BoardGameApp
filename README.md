# 🚀 **Automating Secure Deployment of Board Game Listing WebApp on AWS**

## 🧭 **Project Overview**

A **complete end-to-end CI/CD automation** for deploying a **Dockerized Java Maven web app** on **AWS ECS Fargate**, with **secure image scanning**, **load balancing**, and **real-time monitoring** via **CloudWatch**.

| Key Features         | Description                              |
| -------------------- | ---------------------------------------- |
| **Automation**       | CI/CD using GitHub Actions               |
| **Containerization** | Dockerized Java Maven app                |
| **Image Registry**   | AWS ECR stores Docker images             |
| **Deployment**       | AWS ECS Fargate for scalable app hosting |
| **Load Balancing**   | Application Load Balancer (ALB)          |
| **Security**         | Trivy & OWASP Dependency Check           |
| **Monitoring**       | CloudWatch Logs & Metrics                |

---

## 🏗️ **Architecture Workflow**

| Step | Component                  | Function                                               |
| ---- | -------------------------- | ------------------------------------------------------ |
| 1    | **GitHub**                 | Source code repository                                 |
| 2    | **GitHub Actions (CI/CD)** | Builds, tests, scans Docker image, triggers deployment |
| 3    | **AWS ECR**                | Secure Docker image storage                            |
| 4    | **AWS ECS (Fargate)**      | Runs containerized application                         |
| 5    | **AWS ALB**                | Distributes traffic across ECS tasks                   |
| 6    | **Amazon CloudWatch**      | Captures logs & metrics for ECS and ALB                |

**Flow Diagram (Simplified):**
GitHub → GitHub Actions → ECR → ECS (Fargate) → ALB → CloudWatch

---

## ⚙️ **Deployment Process**

| Step                         | Task                         | Command / Action                                 |
| ---------------------------- | ---------------------------- | ------------------------------------------------ |
| **1. Build App**             | Package Maven project        | `mvn clean package`                              |
| **2. Dockerize**             | Build container image        | `docker build -t boardgame-app .`                |
| **3. Push to ECR**           | Tag & push image             | `docker push <AWS_ECR_URL>/boardgame-app:latest` |
| **4. Deploy to ECS**         | Fargate tasks + ALB routing  | ECS service auto-pulls image                     |
| **5. CI/CD Automation**      | Build → Scan → Push → Deploy | Managed via GitHub Actions                       |
| **6. Monitor in CloudWatch** | View logs & metrics          | ECS CPU, memory, health checks                   |

---

## 🧠 **Skills & Tools Demonstrated**

| Category             | Tools / Skills                         |
| -------------------- | -------------------------------------- |
| **DevOps & Cloud**   | AWS ECS, ECR, Fargate, ALB, CloudWatch |
| **CI/CD Pipeline**   | GitHub Actions                         |
| **Containerization** | Docker                                 |
| **Security**         | Trivy, OWASP Dependency Check          |
| **Monitoring**       | CloudWatch Logs, Metrics               |
| **IaC**              | Terraform Integration                  |

---

## 📸 **Project Screenshots**

| Section                     | Description                    | Screenshot                                                                                   |
| --------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------- |
| **GitHub Actions Workflow** | CI/CD pipeline automation      | ![Workflow](https://github.com/user-attachments/assets/e54e5760-f620-4fd6-9cdb-5bfd4cdeb27a) |
| **ECR Repository**          | Docker image tags in AWS ECR   | ![ECR](https://github.com/user-attachments/assets/101361fb-9c4a-44c0-95a0-89a837e036e3)      |
| **ECS Cluster & Tasks**     | Running containers on Fargate  | ![ECS](https://github.com/user-attachments/assets/483ae6b3-8fb5-447d-9cab-11e82a18130c)      |
| **ECS Task Definition**     | Configuration for Docker tasks | ![TaskDef](https://github.com/user-attachments/assets/4f455674-e5df-41f0-a7f2-2a5e3ff320a6)  |
| **ALB Target Group**        | Load balancer health status    | ![ALB](https://github.com/user-attachments/assets/e33140ea-46fc-48ec-b65e-4899b4ca82ab)      |
| **CloudWatch Logs**         | ECS logs output                | ![Logs](https://github.com/user-attachments/assets/793ef8cc-191d-45ee-91c4-db87091aad58)     |
| **CloudWatch Metrics**      | ECS performance metrics        | ![Metrics](https://github.com/user-attachments/assets/0212066a-694f-4e02-bede-776ce65e71c4)  |
| **Running App via ALB**     | Live application endpoint      | ![App](https://github.com/user-attachments/assets/90a0350d-f1e5-4954-ab04-4d623fdbba2e)      |

---

## 🌐 **Application Access**

🔗 `http://<your-alb-dns-name>.ap-south-1.elb.amazonaws.com`

---

## 👨‍💻 **Author**

**Riddhesh Sutar – AWS & DevOps Fresher**
📦 GitHub: [github.com/riddheshsutar](https://github.com/riddheshsutar)
💼 LinkedIn: [linkedin.com/in/sutarriddhesh22](https://www.linkedin.com/in/sutarriddhesh22/)

---
