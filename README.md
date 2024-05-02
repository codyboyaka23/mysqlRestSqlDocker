## Accounts
```text
database user: root, password: rootpwd
tomcat user: cody, password: codypwd
```
## Deploy
Per crare e modificare le resources xml, in docker-compose modifica il valore delle seguenti variabili 
```yml
SHARED_USER: riccardo
SHARED_GROUP: riccardo
SHARED_UID: 1000
SHARED_GID: 1000
```
con quelli del tuo utente del sistema operativo host.
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