# Python App – CI/CD Deployment with Docker, EC2 & GitHub Actions

This project demonstrates a full DevOps CI/CD pipeline for deploying a Python application using Docker, GitHub Actions, and AWS EC2. Every push to the `main` branch automatically deploys the latest version to a live cloud server.

---

## 📦 Tech Stack

| Tool | Purpose |
|---|---|
| Python 3.11 | Application runtime |
| Docker | Containerisation |
| GitHub Actions | CI/CD pipeline |
| AWS EC2 (Ubuntu) | Cloud server |
| SSH | Secure remote deployment |

---

## 🏗️ Architecture

```
Developer Push (GitHub)
        ↓
GitHub Actions (CI/CD Pipeline)
        ↓
SSH into EC2 Server
        ↓
Docker Build & Run
        ↓
Live Application on Port 8000
```

---

## 📁 Project Structure

```
pythonapp/
├── pythonapp.py                   # Python web application
├── Dockerfile                     # Docker image definition
├── .github/
│   └── workflows/
│       └── docker.yml             # GitHub Actions CI/CD pipeline
└── README.md
```

---

## 🚀 API Endpoints

| Endpoint | Method | Description |
|---|---|---|
| `/` | GET | Returns app status + timestamp |
| `/health` | GET | Health-check for monitoring |

---

## 🐳 Run Locally with Docker

```bash
# 1. Build the image
docker build -t my-app .

# 2. Run the container
docker run -d -p 8000:8000 --name my-app my-app

# 3. Test it
curl http://localhost:8000
curl http://localhost:8000/health
```

---

## 🔄 CI/CD Pipeline

| Step | What happens |
|---|---|
| `git push origin main` | Triggers the GitHub Actions workflow |
| Checkout | Latest code is fetched |
| SSH into EC2 | Secure connection using stored secret key |
| Pull latest code | Repo is cloned / updated on the server |
| Docker build | Fresh image is built from `Dockerfile` |
| Docker run | Old container is replaced; new one starts |

---

## 🔐 GitHub Secrets Required

Go to **GitHub → Repository → Settings → Secrets → Actions → New repository secret**

| Secret Name | Value |
|---|---|
| `EC2_HOST` | Your EC2 public IP address |
| `EC2_USER` | `ubuntu` |
| `EC2_KEY` | Contents of your `.pem` private key file |

---

## ☁️ EC2 Setup Checklist

- [ ] EC2 instance running (Ubuntu 22.04 recommended)
- [ ] Docker installed on EC2

```bash
sudo apt update && sudo apt install -y docker.io
sudo systemctl enable docker
sudo usermod -aG docker ubuntu   # allow ubuntu user to run docker
```

- [ ] Port **8000** open in the EC2 Security Group (inbound TCP)
- [ ] SSH (port 22) open in the EC2 Security Group

---

## 🧪 Test After Deployment

```bash
curl http://<YOUR_EC2_PUBLIC_IP>:8000
# Expected → {"status": "ok", "message": "Python App is running!", ...}

curl http://<YOUR_EC2_PUBLIC_IP>:8000/health
# Expected → {"status": "healthy"}
```

---

## 👨‍💻 Author

**Faddy01**

---

## 📌 License

Educational project – free to use and modify.
