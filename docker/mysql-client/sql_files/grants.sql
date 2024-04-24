
CREATE USER 'routeruser'@'%' IDENTIFIED BY 'routeruserpwd';
GRANT ALL PRIVILEGES ON mysql_rest_sql_docker.* TO 'routeruser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;
