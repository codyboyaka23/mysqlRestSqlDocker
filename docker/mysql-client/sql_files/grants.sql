
CREATE USER 'routeruser'@'%' IDENTIFIED BY 'routeruserpwd';
GRANT ALL PRIVILEGES ON mrs_demo_cluster.* TO 'routeruser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
