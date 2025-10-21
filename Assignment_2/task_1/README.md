

# 🐳 Docker Task – Git Installed Image (Using Alpine)

## a. Create an Image with Git Installed

We created a **Dockerfile** using the **Alpine** base image and installed **Git** inside it.

### 🧾 Dockerfile

```dockerfile
FROM alpine:latest
RUN apk update && apk add git
CMD ["sh"]
```

---

## b. Build and Tag the Image

Build the Docker image and tag it as **Qu1:v1.0** using the following command:

```bash
docker build -t Qu1:v1.0 .
```

### 🧩 Observation

After the image is built, a new image named **Qu1** with tag **v1.0** appears in the image list.

Check using:

```bash
docker images
```

**Example output:**

```
REPOSITORY   TAG     IMAGE ID       CREATED          SIZE
Qu1          v1.0    a1b2c3d4e5f6   10 seconds ago   35MB
```

---

## c. Create a Container and Run in Background

Create and run a container from the image using the `-d` (detached) flag:

```bash
docker run -d --name git_container Qu1:v1.0 tail -f /dev/null
```

### ⚙️ Explanation

* `-d` → runs the container in the background.
* `--name git_container` → gives the container a custom name.
* `tail -f /dev/null` → keeps the container running continuously.

To verify the running container:

```bash
docker ps
```

---

## d. Attach to the Container and Verify Git Installation

Attach to the running container:

```bash
docker attach git_container
```

### 💡 Usability

`docker attach` allows you to connect your terminal to a running container and interact directly with its shell or process.

Inside the container, verify if Git is installed:

```bash
git --version
```

**Expected output:**

```
git version 2.43.0
```

---

## ✅ Summary

| Step | Command                                                         | Description                  |
| ---- | --------------------------------------------------------------- | ---------------------------- |
| 1    | `FROM alpine`                                                   | Use Alpine as the base image |
| 2    | `RUN apk add git`                                               | Install Git                  |
| 3    | `docker build -t Qu1:v1.0 .`                                    | Build and tag the image      |
| 4    | `docker run -d --name git_container Qu1:v1.0 tail -f /dev/null` | Run container in background  |
| 5    | `docker attach git_container`                                   | Attach to running container  |
| 6    | `git --version`                                                 | Verify Git installation      |

---

## 📘 Conclusion

This task demonstrates how to:

* Create a **custom Docker image** with Git installed.
* **Tag**, **run**, and **verify** the image.
* Use **docker attach** to access and interact with a running container.

---

✅ **Author:** Muhammad Hassan Shahzad
📅 **Date:** October 2025
🧠 **Topic:** Docker – Image Creation & Container Management

---
