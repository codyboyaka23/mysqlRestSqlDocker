## Accounts
```text
database user: root, password: rootpwd
tomcat user: cody, password: codypwd
```
## Deploy
```bash
docker compose up -d
docker exec -ti mysql-restsql-restsql-container sh /etc/opt/setsec
docker compose restart restsql-service
```
## Stop/Start
```bash
docker compose down --volumes
docker compose up -d
```