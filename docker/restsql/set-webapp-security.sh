#!/bin/sh
cp /usr/local/tomcat/webapps/restsql/WEB-INF/web.xml /usr/local/tomcat/webapps/restsql/WEB-INF/web.xml.original
cp /etc/opt/restSqlWeb.xml /usr/local/tomcat/webapps/restsql/WEB-INF/web.xml
head -n -1 /etc/opt/restsql/restsql.properties > tmp && mv tmp /etc/opt/restsql/restsql.properties
echo 'security.privileges=/etc/opt/restsql-security/privileges.properties' >> /etc/opt/restsql/restsql.properties
chown -R 1000:1000 /etc/opt/restsql
exit 0