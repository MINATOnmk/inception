# User Documentation
---
## 1. Description of Services
* **NGINX**: Entrypoint to the infrastructure on port 443 with TLSv1.2.
* **WordPress**: Web application running with `php-fpm`.
* **MariaDB**: Relational database for WordPress data.
- **Redis**: Provides memory-based caching for WordPress.
- **Adminer**: Web-based database management interface for MariaDB.
- **cAdvisor**: Collects and displays real-time resource usage and performance metrics for running containers.
- **Static Website**: A non-PHP showcase website (e.g., HTML/CSS/JS or Go) served independently.
---

## 2. Managing the Application
* **Start stack**: `make`
* **Stop stack**: `make down`
* **Clean stack**: `make clean`

---

## 3. Accessing the Website & Admin Panel
* **Website**: `https://<login>.42.fr`
* **Admin Panel**: `https://<login>.42.fr/wp-admin` ,  you can find the `<login>` in your `srcs/.env` file
---

## 4. Credentials Management
* Credentials and environment variables are defined in `srcs/.env`
* Never store plain text passwords in Dockerfiles or the repository , store all this information in the `srcs/.env` file

---

## 5. Checking Service Health
* View running containers and status:
  ```bash
  docker compose -f srcs/docker-compose.yml ps
  ```
* Check containers logs:
  ```bash
    docker compose -f srcs/docker-compose.yml logs 
  ```