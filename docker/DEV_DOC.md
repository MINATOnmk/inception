# Developer Documentation

need more
## Services

| Service | Purpose | URL |
|---|---|---|
| Nginx | Web server | https://localhost |
| WordPress | CMS | https://localhost |
| MariaDB | Database | — |
| Redis | Caching | — |
| Adminer | DB management | http://localhost:8081 |
| Static site | Simple website | http://localhost:8080 |
| cAdvisor | Container monitoring | http://localhost:8082 |


## Commands

| Action | Command |
|---|---|
| Start | `make` |
| Stop | `make down` |
| Rebuild | `make re` |
| View containers | `docker ps` |
| View logs | `docker logs <container>` |

## Credentials

Stored in `srcs/.env` and `secrets/` — not hardcoded.

## Quick Checks

* View running containers and status:
  ```bash
  docker compose -f srcs/docker-compose.yml ps
  ```

* Check containers logs:
  ```bash
  docker compose -f srcs/docker-compose.yml logs 
  ```

* Redis
  ```bash
  docker exec -it redis redis-cli ping
  #expected output is -> PONG
  ```

* Website
   ```
   Open https://localhost
   check the html output is working
   ```

* cadvisor
   ```
   Open https://localhost
   ```
   * **or run**:
   ```
   curl -I http://localhost:8080
   ```

* adminer
   ```
   Open https://localhost
   ```
   * **or run**:
   ```
   curl -I http://localhost:8080
   ```

## Notes

* check the ps cmd before test and if something wrong check logs
* only port 443 is free