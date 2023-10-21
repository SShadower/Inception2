-- setup_db.sql
CREATE DATABASE IF NOT EXISTS $mariaDB_n ;
CREATE USER IF NOT EXISTS '$mariaDB_user'@'%' IDENTIFIED BY '$mariaDB_pwd' ; 
GRANT ALL PRIVILEGES ON $mariaDB_n.* TO '$mariaDB_user'@'%' ; 
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ; 
FLUSH PRIVILEGES; 