# some notes from official guide


```sh
mkdir -p "./app/onlyoffice/mysql/conf.d";
mkdir -p "./app/onlyoffice/mysql/data";
mkdir -p "./app/onlyoffice/mysql/initdb";
# For Community Server data and logs
mkdir -p "./app/onlyoffice/CommunityServer/data";
mkdir -p "./app/onlyoffice/CommunityServer/logs";
# For Document server data and logs
mkdir -p "./app/onlyoffice/DocumentServer/data";
mkdir -p "./app/onlyoffice/DocumentServer/logs";
# And for Mail Server data and logs
mkdir -p "./app/onlyoffice/MailServer/data/certs";
mkdir -p "./app/onlyoffice/MailServer/logs";


echo "[mysqld]
sql_mode = 'NO_ENGINE_SUBSTITUTION'
max_connections = 1000
max_allowed_packet = 1048576000" > /docker/mysql/conf.d/onlyoffice.cnf


echo "CREATE USER 'onlyoffice_user'@'localhost' IDENTIFIED BY 'onlyoffice_pass';
CREATE USER 'mail_admin'@'localhost' IDENTIFIED BY 'Isadmin123';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'%' IDENTIFIED BY 'my-secret-pw';
GRANT ALL PRIVILEGES ON * . * TO 'onlyoffice_user'@'%' IDENTIFIED BY 'onlyoffice_pass';
GRANT ALL PRIVILEGES ON * . * TO 'mail_admin'@'%' IDENTIFIED BY 'Isadmin123';
FLUSH PRIVILEGES;" > /docker/mysql/initdb/setup.sql
```
