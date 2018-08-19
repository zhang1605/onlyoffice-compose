#!/bin/bash
if [ -f done.txt ]
then
	echo "set"
else
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
	touch done.txt
fi