CREATE DATABASE wordpress_db;
GRANT ALL ON wordpress_db.* TO 'user132'@'localhost' IDENTIFIED BY 'thatisagoodpasswd';
-- ALTER USER 'root'@'localhost' IDENTIFIED BY 'dontlookatmelikethat';
flush privileges;
