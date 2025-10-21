
# 🐳 Docker Task 3 – PHP Server, MySQL, and phpMyAdmin using Docker Compose

## 🎯 Objective

In this task, we create a **multi-container application** using **Docker Compose** that includes:

1. A **PHP web server**
2. A **MySQL database server**
3. A **phpMyAdmin** interface to manage the database

The containers will communicate through a common Docker network.

---

## 📂 Project Structure

```
ex3/
│
├── docker-compose.yml
├── php/
│   └── src/
│       └── (PHP source files copied from Qu3 folder)
```

---

## a. 🐬 MySQL Service Configuration

We create an image for the MySQL server with the following characteristics:

* Derived from the official **MySQL** image
* Always restarts on failure
* Port mapping: **9906:3306**
* Environment variables for database configuration

### 🧩 docker-compose.yml (MySQL section)

```yaml
version: '3'

services:
  db:
    image: mysql:latest
    container_name: mysql_server
    restart: always
    ports:
      - "9906:3306"
    environment:
      MYSQL_ROOT_PASSWORD: MYSQL_ROOT_PASSWORD
      MYSQL_DATABASE: MYSQL_DATABASE
      MYSQL_USER: MYSQL_USER
      MYSQL_PASSWORD: MYSQL_PASSWORD
    volumes:
      - db_data:/var/lib/mysql
    networks:
      - my_network
```

✅ **Explanation:**

* `restart: always` → ensures the MySQL server restarts automatically if stopped or crashed.
* Environment variables define the database name, user, and password.
* `ports` map the container’s internal MySQL port (3306) to **9906** on the host.
* A volume named `db_data` is created for data persistence.

---

## b. 🧰 phpMyAdmin Service Configuration

We add a phpMyAdmin container to manage the MySQL database through a web interface.

### 🧩 docker-compose.yml (phpMyAdmin section)

```yaml
  phpmyadmin:
    image: phpmyadmin:latest
    container_name: phpmyadmin_app
    restart: always
    ports:
      - "8080:80"
    environment:
      PMA_HOST: db
    depends_on:
      - db
    networks:
      - my_network
```

✅ **Explanation:**

* `PMA_HOST: db` → connects phpMyAdmin to the MySQL container.
* The container depends on the database service (`depends_on`).
* The phpMyAdmin web interface runs on **[http://localhost:8080](http://localhost:8080)**.

---

## c. 🖥️ PHP Server Configuration

We configure a PHP service that runs the website code and connects to the MySQL database.

### 🧩 docker-compose.yml (PHP section)

```yaml
  php:
    image: php:apache
    container_name: php_server
    restart: always
    ports:
      - "8000:80"
    volumes:
      - ./php/src:/var/www/html
    depends_on:
      - db
    networks:
      - my_network
```

✅ **Explanation:**

* Runs a PHP server using the `php:apache` image.
* Port **8000** is used to access the PHP website via browser.
* The folder `php/src` (auto-created) is mounted to `/var/www/html` inside the container.
* Depends on the database container for connectivity.

---

## 🕸️ Network and Volume Configuration

At the bottom of the Compose file:

```yaml
networks:
  my_network:

volumes:
  db_data:
```

✅ **Explanation:**

* `my_network` ensures containers can communicate with each other.
* `db_data` persists MySQL data between container restarts.

---

## 🚀 Steps to Run the Application

1. **Navigate to the project directory:**

   ```bash
   cd ex3
   ```

2. **Start the containers:**

   ```bash
   docker-compose up --build -d
   ```

3. **Verify running containers:**

   ```bash
   docker ps
   ```

4. **Copy PHP source code:**

   * Copy all PHP files from the **Qu3** folder into the `php/src` directory.
   * This folder is automatically created when the container starts.

5. **Access the services:**

   * 🌐 PHP Website: [http://localhost:8000](http://localhost:8000)
   * 🗄️ phpMyAdmin Interface: [http://localhost:8080](http://localhost:8080)

6. **Login to phpMyAdmin:**

   * **Username:** `root`
   * **Password:** `MYSQL_ROOT_PASSWORD` (as defined in your environment variables)

---

## 🧠 Verification Commands

View networks:

```bash
docker network ls
```

View volumes:

```bash
docker volume ls
```

View running containers:

```bash
docker ps
```

Stop and remove all services:

```bash
docker-compose down
```

---

## ✅ Summary

| Component      | Image             | Port | Role                          | Depends On |
| -------------- | ----------------- | ---- | ----------------------------- | ---------- |
| **php**        | php:apache        | 8000 | Hosts PHP website             | db         |
| **db**         | mysql:latest      | 9906 | MySQL database                | -          |
| **phpmyadmin** | phpmyadmin:latest | 8080 | Web-based database management | db         |

---

## 📘 Conclusion

This task demonstrates how to use **Docker Compose** to set up a complete LAMP-style stack:

* A **PHP web server** connected to a **MySQL database**
* A **phpMyAdmin** container for easy database management
* Use of **networks**, **volumes**, and **service dependencies** for container communication and persistence

The final setup allows visiting:

* **Website:** `http://localhost:8000`
* **phpMyAdmin:** `http://localhost:8080`

---

✅ **Author:** Muhammad Hassan Shahzad
📅 **Date:** October 2025
🧠 **Topic:** Docker Compose – PHP, MySQL & phpMyAdmin Integration

---
