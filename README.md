# Deploy e settaggi di sicurezza
```bash
docker compose up -d
docker exec -ti mysql-restsql-restsql-container sh /etc/opt/setsec
docker compose restart restsql-service
```