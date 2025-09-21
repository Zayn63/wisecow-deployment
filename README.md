# Wisecow Project – Accuknox DevOps Trainee Practical Assessment

**Author:** Junaid Mansuri  
**Deployed URL (Local):** https://wisecow.local/  

This repository contains the implementation of the Accuknox DevOps Trainee Practical Assessment.  
All tasks have been completed in a **local Kubernetes environment** due to limited cloud access.  
Screenshots of successful setup, deployment, and CI/CD runs are provided in the `screenshots/` folder.

---

## 📌 Problem Statement 1: Containerisation & Deployment of Wisecow

**Objective:** Containerize and deploy the Wisecow application on Kubernetes with secure TLS communication.

### ✅ Implementation:
- **Dockerization:**  
  - Created a `Dockerfile` to containerize the Wisecow app.  
  - Built and pushed image to Docker Hub: `zayn63/wisecow:latest`.  

- **Kubernetes Deployment:**  
  - Wrote manifests for namespace, service, deployment, and ingress.  
  - Configured ingress with TLS using self-signed certificates.  
  - Verified deployment at `https://wisecow.local/`.  

- **CI/CD (GitHub Actions):**  
  - Automated pipeline for Docker build & push.  
  - Deployment steps included (tested locally).  

- **TLS Implementation (Challenge Goal):**  
  - Configured HTTPS ingress with certificate (`wisecow.pfx`).  
  - Browser access verified with TLS (see screenshots).  

📸 **Screenshots:**  
Located in [`screenshots/`](./screenshots). Includes:  
- Docker build & run  
- Kubernetes pods, services, ingress  
- Application running on `https://wisecow.local/`  
- CI/CD workflow execution  

---

## 📌 Problem Statement 2: Scripting

**Objective:** Choose two automation tasks using Python/Bash.  

### ✅ Implemented:
1. **System Health Monitoring Script**  
   - Scripts:  
     - `scripts/system_health.sh` (Bash)  
     - `scripts/system_health.ps1` (PowerShell)  
   - Monitors CPU, memory, disk usage, and running processes.  
   - Logs alerts if thresholds exceeded → saved in `scripts/system_health.log`.  

2. **Application Health Checker**  
   - Script: `scripts/app_health.py`  
   - Periodically checks application status via HTTP status codes.  
   - Detects if app is *Up* or *Down* and logs results.  

📸 **Screenshots:** Execution logs and monitoring output in `screenshots/`.

---

## 📌 Problem Statement 3: Zero Trust (Optional)

Due to cloud access limitations, **KubeArmor policies were not implemented**.  
However, I have studied the documentation at [KubeArmor Docs](https://docs.kubearmor.io/kubearmor/) and can create a basic zero-trust policy if required in future environments.

---

## 📁 Project Structure

wisecow/
├─ Dockerfile
├─ requirements.txt
├─ .github/workflows/ # CI/CD workflows
├─ k8s/ # Kubernetes manifests & TLS
│ ├─ namespace.yml
│ ├─ service.yml
│ ├─ wisecow-deployment.yml
│ ├─ ingress.yml
│ ├─ ingress-nginx-kind.yaml
│ ├─ wisecow.pfx
├─ scripts/ # Health check & monitoring scripts
│ ├─ app_health.py
│ ├─ system_health.sh
│ ├─ system_health.ps1
│ └─ system_health.log
├─ screenshots/ # Evidence of successful implementation
└─ README.md

yaml
Copy code

---

## 🚀 How to Run Locally

### Prerequisites:
- Docker  
- Kubernetes (Kind / Minikube)  
- kubectl  
- Python 3.x  

### Steps:

# Clone repo
git clone <your-repo>
cd wisecow

# Build Docker image
docker build -t zayn63/wisecow:latest .

# Run container
docker run -d -p 8080:8080 --name wisecow zayn63/wisecow:latest
For Kubernetes:


kubectl apply -f k8s/namespace.yml
kubectl apply -f k8s/wisecow-deployment.yml
kubectl apply -f k8s/service.yml
kubectl apply -f k8s/ingress.yml
Access at:
👉 https://wisecow.local/

⚠️ Notes
CI/CD pipelines were tested on local environment due to cloud restrictions.

Application successfully deployed with TLS and is fully functional locally.

📖 License
This project is licensed under MIT License.

