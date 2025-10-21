
---

# 🧑‍💻 DevOps Assignment 2 – Docker, Images, Containers, Volumes, Networks & Compose

## 🧠 Overview

This **DevOps Assignment 2** demonstrates my complete understanding of **Docker** and its core components — including **containers**, **images**, **volumes**, **networks**, **Dockerfiles**, and **Docker Compose**.
Through this assignment, I have implemented and tested real-world containerization workflows to understand how applications run in **isolated environments** efficiently using Docker.

Each task in this assignment builds on core Docker concepts:

* Building and tagging custom images.
* Running and managing containers.
* Configuring multi-container environments using Docker Compose.
* Networking containers for communication.
* Managing persistent data with Docker volumes.

---

## 📘 Assignment Instructions

1. **Create a private GitHub repository** named **`devops`** in your account.
2. Inside this repository, create a folder named **`assignment2`**.
3. Within `assignment2`, create three subfolders:

   ```
   task1/
   task2/
   task3/
   ```

   Each folder should contain the related code files.
4. **Push all code** to your private GitHub repository after completing each task.
5. **Add collaborator:** `muhammadimranfarooqi` to your repository.
6. **Add a detailed README.md** file in each task folder explaining steps and configurations.
7. **Write a report** in **PDF or Word format** that includes screenshots, explanations, and your GitHub repository link.

---

## 📁 Repository Structure

```
devops/
└── assignment2/
    ├── task1/
    │   └── Dockerfile
    ├── task2/
    │   ├── app.py
    │   ├── docker-compose.yml
    │   ├── Dockerfile
    │   └── requirements.txt
    └── task3/
        ├── docker-compose.yml
        ├── Dockerfile
        ├── php/
        │   └── src/
        │       ├── index.php
        │       └── insert.php
```

---

## ⚙️ Task Details

### 🧩 **Task 1 – Dockerfile for Git Installed Image**

**Objective:**
Create a Docker image with **Git installed** using **Alpine** as the base image.

**Key Steps:**

* Build image using Dockerfile.
* Tag image as `Qu1:v1.0`.
* Run a container in background mode.
* Use `docker attach` to access the container and verify Git installation.

**Concepts Learned:**
✅ Image building, container execution, background running (`-d`), and attach usability.

---

### 🧩 **Task 2 – Flask App with Docker Compose**

**Objective:**
Use the [Docker Compose Getting Started Guide](https://docs.docker.com/compose/gettingstarted/) to run a **Python Flask app** and move app configuration from **Dockerfile** to **Compose file**.

**Key Steps:**

* Simplified Dockerfile with minimal setup.
* Updated docker-compose.yml to handle:

  * Custom **network** for inter-container communication.
  * **Volume** for persistent code storage.
  * **Service** configuration for running the app.

**Concepts Learned:**
✅ Image layering, Compose orchestration, networking, volume management, and app deployment through Compose.

---

### 🧩 **Task 3 – PHP Server with MySQL and phpMyAdmin**

**Objective:**
Use Docker Compose to create a **multi-container web stack** with:

* PHP server
* MySQL database
* phpMyAdmin interface

**Key Steps:**

* Defined MySQL container with environment variables and persistent storage.
* Configured phpMyAdmin container connected to the MySQL database.
* Linked PHP app container to the same network.
* Exposed ports for accessing the website and phpMyAdmin dashboard.

**Concepts Learned:**
✅ Multi-service Compose configuration, environment management, dependency control (`depends_on`), and container networking.

---

## 🚀 Technologies & Concepts Used

| Concept            | Description                                                                                                                                     |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| **Docker Images**  | Lightweight, reusable snapshots of environments containing app code and dependencies.                                                           |
| **Containers**     | Isolated runtime environments created from Docker images.                                                                                       |
| **Volumes**        | Persist data beyond container lifecycle.                                                                                                        |
| **Networks**       | Enable communication between multiple containers.                                                                                               |
| **Dockerfile**     | Blueprint for building custom images.                                                                                                           |
| **Docker Compose** | Tool for defining and running multi-container applications using YAML configuration.                                                            |
| **Commands Used**  | `docker build`, `docker run`, `docker ps`, `docker images`, `docker attach`, `docker-compose up`, `docker network ls`, `docker volume ls`, etc. |

---

## 🧾 Learning Outcome

After completing this assignment, I have:

* Developed a strong understanding of **Docker architecture**.
* Learned to build, tag, and manage **images and containers**.
* Implemented **networks and volumes** for container communication and data persistence.
* Understood how **Docker Compose** simplifies multi-container app management.
* Gained hands-on experience in deploying complete environments in an **isolated and reproducible** manner.

---

## 📘 Deliverables

* ✅ `Dockerfile`, `docker-compose.yml`, and source code for all tasks.
* ✅ `README.md` file explaining each task clearly.
* ✅ A **report (PDF/Word)** including screenshots and explanation.
* ✅ GitHub repository with collaborator access.

---

## 📎 Repository Link

**Repository Name:** `devops`
**Folder Path:** `/assignment2/task1`, `/task2`, `/task3`
**Collaborator:** `muhammadimranfarooqi`

---

## 👨‍💻 Author

**Name:** Muhammad Hassan Shahzad
**Course:** DevOps – Assignment 2
**Date:** October 2025
**Instructor:** Sir Muhammad Imran Farooqi

---

