# NGINX Load-Balanced & SSL-Secured Node.js Cluster

A containerized application architecture using NGINX as a reverse proxy, SSL termination gateway, and load balancer for a scalable Node.js backend cluster.

## Features
- **Load Balancing:** Distributes incoming traffic across multiple Node.js replicas.
- **SSL Termination:** Handles HTTPS traffic on port 8443 using OpenSSL.
- **Auto-HTTP Redirection:** Redirects HTTP requests (port 8080) to HTTPS.
- **Rate Limiting & Compression:** Protects endpoints (5 requests per second) and compresses responses via Gzip.
- **Dynamic Scaling:** Integrated with Docker DNS for instant container scaling.
## Prerequisites

Before running this project, ensure you have the following installed on your system:

- **Docker & Docker Compose** (or **Podman** on Linux/Bazzite)
- **OpenSSL** (for generating local SSL certificates)
- **Git** (for cloning the repository)

> **Note for Linux Users (Rootless Docker/Podman):**  
> This project uses non-privileged host ports (`8080` for HTTP and `8443` for HTTPS) for rootless environments without requiring elevated root permissions. 
## Quick Start

1. **Generate SSL Certificates:**
   ```bash
   mkdir inginx-certs
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
     -keyout inginx-certs/nginx-selfsigned.key \
     -out inginx-certs/nginx-selfsigned.crt \
     -subj "/CN=localhost"
2. **Run the Cluster with 5 Replicas:**
    ```bash
    docker compose up -d --scale app=5
3. **Access the Application:**
   **HTTPS: https://localhost:8443**
   **HTTP (Auto-Redirect): http://localhost:8080** 