*This project has been created as part of the 42 curriculum by mboulagh.*

# Inception Project


## Description
This project sets up a secure infrastructure using Docker Compose on a Virtual Machine. It runs isolated containers for NGINX (with TLSv1.2/1.3), WordPress with `php-fpm`, and MariaDB.

## Instructions
1. **Host Configuration**: Add `127.0.0.1 mboulagh.42.fr` to your `/etc/hosts` file.
2. **Environment**: Configure `srcs/.env` only.
3. **Execution**:
   - Build and start: `make`
   - Stop: `make down`
   - Clean: `make clean`

## Resources & AI Usage
- **Resources**: Official Docker Documentation, `Docker Deep Dive` (2025 Edition) by Nigel Poulton.
- **AI Usage**: Used to assist with Markdown formatting and clarifying Docker concepts and to summary some part of book.
- **https://docs.docker.com/**

## Architectural Comparisons

### Virtual Machines vs Docker
Virtual machines virtualize hardware, requiring a full operating system for each VM. Docker containers virtualize the OS kernel, sharing the host kernel to be lightweight and fast.

### Secrets vs Environment Variables
Environment variables are visible in process listings and `.env` files, whereas secrets are secure, in-memory objects designed for sensitive data like passwords.

### Docker Network vs Host Network
A Docker network provides isolation and container-to-container communication. The host network bypasses isolation, attaching the container directly to the host's network interfaces.

### Docker Volumes vs Bind Mounts
Docker volumes are managed by Docker inside its storage ecosystem for data persistence. Bind mounts map a host directory directly into the container, depending on the host's directory layout.

## Bonus Part
The bonus setup extends the stack with additional isolated containers:
- **Redis**: Provides memory-based caching for WordPress.
- **Adminer**: Web-based database management interface for MariaDB.
- **cAdvisor**: Collects and displays real-time resource usage and performance metrics for running containers.
- **Static Website**: A non-PHP showcase website (e.g., HTML/CSS/JS or Go) served independently.