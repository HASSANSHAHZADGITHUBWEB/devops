

# 🐳 Docker Task 2 – Compose Configuration and App Build

## 🎯 Objective

This task is based on the [Docker Compose Getting Started Guide](https://docs.docker.com/compose/gettingstarted/).
We modified the setup to **move the app build configuration from the Dockerfile to the Compose file**, keeping only minimal setup instructions in the Dockerfile.

---

## a. 🧾 Dockerfile

The **Dockerfile** only contains the basic configuration to install dependencies and set the working directory.

```dockerfile
FROM python:3.9-alpine
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
```

✅ **Explanation:**

* `FROM python:3.9-alpine` → uses a lightweight Python base image.
* `ADD . /code` → copies the project code to the container.
* `WORKDIR /code` → sets the working directory.
* `RUN pip install -r requirements.txt` → installs Python dependencies.

> All other configurations (network, volumes, ports, etc.) are handled in the **docker-compose.yml** file.

---

## b. ⚙️ Updated docker-compose.yml

We updated the **Compose file** to:

1. Create a **custom network** for container communication.
2. Run the **web application**.
3. Create a **volume** for storing the code (since `COPY` was removed from the Dockerfile).

### 🧩 docker-compose.yml

```yaml
version: '3'

services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    command: python app.py
    ports:
      - "5000:5000"
    volumes:
      - .:/code
    networks:
      - my_network

  redis:
    image: "redis:alpine"
    networks:
      - my_network

networks:
  my_network:

volumes:
  code_data:
```

---

## 🚀 Run the Application

Build and start the services using:

```bash
docker-compose up --build
```

After running, open your browser and visit:

```
http://localhost:5000
```

You should see the Flask app running successfully.

---

## 🧠 Verification Commands

### View Networks

```bash
docker network ls
```

### View Volumes

```bash
docker volume ls
```

### Check Running Containers

```bash
docker ps
```

---

## ✅ Summary

| Step | Command / File                | Description                              |
| ---- | ----------------------------- | ---------------------------------------- |
| 1    | `Dockerfile`                  | Contains minimal build setup only        |
| 2    | `docker-compose.yml`          | Handles network, volumes, and app config |
| 3    | `docker-compose up --build`   | Builds and runs the app                  |
| 4    | `docker network ls`           | Shows created network                    |
| 5    | `docker volume ls`            | Shows created volume                     |
| 6    | Visit `http://localhost:5000` | Verify app is running                    |

---

## 📘 Conclusion

In this task, we:

* Simplified the **Dockerfile** to focus only on dependency installation.
* Shifted all app configurations (network, volumes, and commands) to **docker-compose.yml**.
* Verified container communication through a **custom Docker network**.
* Mounted a **volume** to persist and share code between containers.

This structure follows **best practices** by separating image build logic (Dockerfile) from environment setup (Compose).

---

✅ **Author:** Muhammad Hassan Shahzad
📅 **Date:** October 2025
🧠 **Topic:** Docker Compose – Networks, Volumes, and Multi-Container Setup

---
