# Developer Documentation

need more
## Services

| Service | Purpose | URL |
|---|---|---|
| Nginx | Web server | - |
| WordPress | CMS | https://login.42.fr |
| MariaDB | Database | — |
| Redis | Caching | — |
| Adminer | DB management | http://localhost:8080 |
| Static site | Simple website | http://localhost:8081 |
| cAdvisor | Container monitoring | http://localhost:8082 |

## prerequisites , setup docker
```
curl https://get.docker.com | sh
```

## setup , Commands

| Action | Command |
|---|---|
| Start | `make` |
| Stop | `make down` |
| Rebuild | `make re` |
| View containers | `docker ps` |
| View logs | `docker logs <container>` |

## Credentials

Stored in `srcs/.env` — not hardcoded.
## use named volume in this path
``` /home/login/data ```
## Quick Checks

* View running containers and status:
  ```bash
  docker compose -f srcs/docker-compose.yml ps
  ```
  * Check volume :
  ```bash
  docker compose -f srcs/docker-compose.yml volumes
  ```

* Check containers logs:
  ```bash
  docker compose -f srcs/docker-compose.yml logs 
  ```

* Redis
  ```bash
  docker exec -it redis redis-cping
  #expected output is -> PONG
  ```

* Website
   ```
   Open http://localhost:8081
   check the html output is working
   ```

* cadvisor
   ```
   Open http://localhost:8082
   ```
   * **or run**:
   ```
   curl http://localhost:8082
   ```

* adminer
   ```
   Open http://localhost:8080
   ```
   * **or run**:
   ```
   curl http://localhost:8080
   ```

## Notes

* check the ps cmd before test and if something wrong check logs