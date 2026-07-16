# 🚀 INCEPTION PROJECT - FINAL CHECKLIST

## 1. 🐬 MARIADB (Database Infrastructure)
- [ ] Understand `set -e` role in the entrypoint script.
- [ ] Explain why `--bootstrap` is used (Memory, No Network, Direct I/O) vs live mode.
- [ ] Confirm `FLUSH PRIVILEGES;` is removed (since modern SQL commands flush implicitly).
- [ ] Differentiate between `mysqld` (the server daemon) and `mysql` (the client CLI).
- [ ] Master the `<< EOF` (Here-Doc) syntax for passing SQL commands via script.
- [ ] Use `sed -i` to change `bind-address` from `127.0.0.1` to `0.0.0.0` inside `/etc/mysql/mariadb.conf.d/50-server.cnf`.
- [ ] Ensure `/run/mysqld` directory is created and owned by `mysql:mysql`.
- [ ] ⚠️ **[MISSING]** Explain what happens to data inside `/var/lib/mysql` when the container restarts vs when the volume is deleted.
- [ ] ⚠️ **[MISSING]** Understand how MariaDB uses `cgroups` to limit its RAM if defined in docker-compose.

---

## 2. 🛡️ NGINX (The Only Gateway)
### Config File & Core Concepts
- [ ] Explain the hierarchy of NGINX configuration (`http {}`, `server {}`, `location {}` blocks).
- [ ] Enforce **TLSv1.2 / TLSv1.3 only** (Disable TLSv1.0 and v1.1).
- [ ] Explain the **SSL Handshake** steps (Key exchange, certificate validation).
- [ ] Master the routing logic of `try_files $uri $uri/ /index.php?$args;` using test cases (`/about`, `/blog/post`).
- [ ] Understand FastCGI protocol and why `SCRIPT_FILENAME $document_root$fastcgi_script_name;` is critical for PHP execution.
- [ ] Use regex in `location ~ \.php$` to catch and forward PHP requests to port 9000.

### SSL Script & Daemon
- [ ] Use `openssl` with `-x509` (self-signed) and `-nodes` (no passphrase for automated boot).
- [ ] Optimize the certificate by keeping ONLY `-subj "/CN=$DOMAIN_NAME"` to clean up metadata.
- [ ] Explain why `exec nginx -g "daemon off;"` is used to keep the container alive (PID 1).
- [ ] Modify the default configuration directly or inside `/etc/nginx/conf.d/default.conf`.
- [ ] ⚠️ **[MISSING]** Explain why NGINX logs (`access.log`, `error.log`) should be linked to `stdout`/`stderr` or checked inside the container.

---

## 3. 📝 WORDPRESS & PHP-FPM
### Dockerfile & Config Tweak
- [ ] Explain the role of each package: `php8.2-fpm` (FastCGI manager), `php8.2-mysql` (driver), `mariadb-client` (for health-checks), `curl`.
- [ ] Remove the external `www.conf` copy and use `sed -i` directly on the original file to set `listen = 9000` and `clear_env = no`.
- [ ] Download and configure `wp-cli.phar`, making it executable.
- [ ] Understand the process manager settings (`pm = dynamic`, workers, children limits).

### Entrypoint Script & Configuration
- [ ] Explain the `mysqladmin ping` loop (Why we wait for MariaDB network port to open before running `wp core install`).
- [ ] ⚠️ **[MISSING/REPLACE]** Better alternative for the loop: Use `sleep 2` loop with `mariadb-client` or a lightweight native check.
- [ ] Master all key `wp` commands (`wp core download`, `wp config create`, `wp core install`, `wp user create`).
- [ ] Configure the Redis Object Cache plugin via `wp-cli` and understand how it reduces DB queries by caching in memory.
- [ ] ⚠️ **[MISSING]** Ensure the owner of the files in `/var/www/html` is `www-data:www-data` so PHP can write or install plugins.

---

## 4. 🐙 DOCKER COMPOSE (Orchestration)
- [ ] Define what Docker Compose is and how it interacts with the Docker Engine API.
- [ ] Master core keywords: `services`, `volumes`, `networks`, `version`.
- [ ] Understand the `depends_on` block (controls startup order, but NOT service readiness).
- [ ] Differentiate between `ports` mapping (Host:Container) vs `expose` (internal network only).
- [ ] Explain `restart: always` or `on-failure` policies.
- [ ] Understand how `.env` files inject variables securely into the compose configuration without hardcoding secrets.
- [ ] ⚠️ **[MISSING]** Explain what `build: .` does behind the scenes (triggers the Dockerfile build before orchestration).

---

## 5. 🛠️ MAKEFILE & DOCKER COMMANDS
- [ ] Implement standard targets: `all`, `up`, `down`, `re`, `clean`, `fclean`.
- [ ] `docker compose up --build -d` (Rebuild layers if changed, run detached).
- [ ] `docker compose down --volumes` (Purge containers, networks, and persistent data).
- [ ] `docker compose down --rmi all` (Clean up space by removing images).
- [ ] Master debugging commands: `docker ps`, `docker logs -f <service>`, `docker exec -it <container> sh`.
- [ ] ⚠️ **[MISSING]** Add a clean target that explicitly clears the persistent volume directory on the host machine (e.g., `/home/login/data/`).

---

## 6. 🌐 NETWORKING & STORAGE (Deep Concepts)
- [ ] Explain the **Linux Bridge** architecture (How it acts as a Layer 2 Switch for containers and Layer 3 Router via host NAT).
- [ ] Understand **Network Namespaces** (How Linux isolates network interfaces per container).
- [ ] Differentiate between `bridge` (default custom driver) vs `host` or `none` network drivers.
- [ ] Explain the difference between **Docker Volumes** (managed inside `/var/lib/docker/`) vs **Bind Mounts** (mapped to explicit host paths), and why the subject mandates named volumes linked to host directories.

## 📦 7. VOLUMES & DATA PERSISTENCE (Storage Deep Dive)
- [ ] Differentiate between **Named Volumes** (managed by Docker) vs **Bind Mounts** (static host paths), and why Inception mandates named volumes mapped to host paths.
- [ ] Master the syntax in `docker-compose.yml` for defining named volumes with custom driver options (`device`, `o=bind`, `type=none`).
- [ ] Explain the **Data Initialization** feature: How Docker copies files from inside the image (e.g., `/var/www/html` in WordPress) into an empty volume on the first boot.
- [ ] ⚠️ **[MISSING]** Understand the exact path requirements for the evaluation: Why volumes MUST point to `/home/login/data/wordpress` and `/home/login/data/mariadb` (where `login` is your intra login).
- [ ] ⚠️ **[MISSING]** Explain what happens to the files on the Host machine when you run `docker compose down` vs `docker compose down -v` (or `docker volume rm`).
- [ ] ⚠️ **[MISSING]** Permissions Check: Explain why the host directories need proper user permissions (e.g., `chown -R www-data:www-data` or `mysql:mysql` inside the containers) to avoid `Permission Denied` errors on the host storage layer.
- [ ] ⚠️ **[MISSING]** Orphaned Volumes: Know how to check for leaked or unused volumes using `docker volume ls` and clean them up using `docker volume prune`.

# 🌟 INCEPTION PROJECT - BONUS PART CHECKLIST

## 1. 📊 cADVISOR (Container Monitoring)
- [ ] Define what cAdvisor is (Container Advisor by Google) and what metrics it collects (CPU, Memory, Network, Disk usage).
- [ ] Explain why cAdvisor needs **Bind Mounts** pointing to host system paths (like `/`, `/var/run`, `/sys`, `/var/lib/docker/`) instead of normal Named Volumes.
- [ ] Master the core explanation: cAdvisor is monitoring the *entire host* and other containers from the inside; it needs raw access to the Linux host system files (`/sys/fs/cgroup`, etc.) to read resource stats directly from the Kernel.
- [ ] Understand the command `CMD ["cadvisor", "-logtostderr"]` (forces cAdvisor to send all its internal application logs directly to `stderr/stdout` so you can view them using `docker logs`).
- [ ] ⚠️ **[MISSING]** Explain why cAdvisor volumes are often mounted as `:ro` (Read-Only) and why this is a critical security best practice.

---

## 2. 🌐 STATIC WEB SITE
- [ ] Confirm your Dockerfile builds from `alpine` and runs its own internal NGINX daemon in the foreground using `CMD ["nginx", "-g", "daemon off;"]`.
- [ ] Understand why its internal NGINX listens on **internal port 80**, while the main gateway NGINX proxies the traffic securely via **port 443**.
- [ ] Master the use of the trailing slash `/` in the main NGINX `proxy_pass http://static_web:80/;` to strip the `/static` URI prefix.

---

## 3. 🛡️ ADMINER (Database Management CLI/GUI)
- [ ] Explain what Adminer is (a lightweight, single-file database management tool alternative to phpMyAdmin).
- [ ] Understand how Adminer works behind the scenes: It doesn't host the database; it is just a PHP script that acts as a client. It connects to the `mariadb` container over the internal network via port 3306.
- [ ] Tweak the Dockerfile to install `php` and `php-mysql` (or `php-mysqli`/`php-pdo_mysql`) drivers so the PHP engine can talk to the MariaDB server.
- [ ] Ensure the internal PHP built-in server or FastCGI runs on an internal port (e.g., 8080) with **no external ports exposed**.
- [ ] ⚠️ **[MISSING]** Know how to log in during evaluation: Explain what to type in the Adminer login screen (Server: `mariadb`, Username: `$MYSQL_USER`, Password: `$MYSQL_USER_PASSWORD`).

---

## 4. 🚀 REDIS (Object Cache Memory)
### Core Concepts & Storage
- [ ] Define what Redis is (Remote Dictionary Server) and how it works as an **In-Memory** key-value database.
- [ ] Explain how Redis stores data: It keeps everything in **RAM** for ultra-fast access, but uses snapshots (RDB/AOF files) to save data to the disk periodically.
- [ ] Master the **Protected Mode** concept: Why we must turn it off (`protected-mode no` or bind to `0.0.0.0`) inside the Redis config so that the WordPress container can access it over the internal network, while keeping it safe from the host's external network.

### WordPress Integration
- [ ] Identify what you injected into the WordPress script/config: `wp config set WP_CACHE true --raw` and the Redis host constants (`WP_CACHE_KEY_SALT`, `WP_REDIS_HOST`).
- [ ] Explain the mechanics of Redis with WordPress: Instead of WordPress querying the MariaDB database on the disk for every single page load, it checks Redis RAM first. If the data is there (Cache Hit), it serves it instantly.
- [ ] Answer the architect question: *Does Redis work with all websites or just WordPress?* (It works with **any** application/website that has a Redis client/driver, but it needs explicit plugin or code integration to know what to cache).
- [ ] ⚠️ **[MISSING]** Know how to verify Redis cache is active during evaluation using the command `redis-cli monitor` inside the Redis container while refreshing your WordPress page.