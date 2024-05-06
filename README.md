## Accounts
```text
database user: root, password: rootpwd
tomcat user: cody, password: codypwd
```
## Sviluppo
Per poter crare e modificare le resources xml sulla machina host dello sviluppatore, 
in docker-compose modifica il valore delle seguenti variabili con quelli del tuo utente del sistema operativo host.
```yml
SHARED_USER: riccardo
SHARED_GROUP: riccardo
SHARED_UID: 1000
SHARED_GID: 1000
```
## Deploy
```bash
docker compose up -d
docker exec -ti mysql-restsql-restsql-container sh /etc/opt/setsec
docker compose restart restsql-service
```