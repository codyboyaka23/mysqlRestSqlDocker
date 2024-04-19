# Deploy e settaggi di sicurezza
```bash
docker compose up -d
docker exec -ti restsql-container sh /etc/opt/setsec
docker compose restart restsql-service
```