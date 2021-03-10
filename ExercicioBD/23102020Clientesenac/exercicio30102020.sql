/*CREATE USER 'novousuario'@'localhost' IDENTIFIED BY '1234';

REVOKE ALL, GRANT OPTION FROM novousuario@localhost;

SELECT user FROM mysql.user;*/

/*
create user 'superusuario'@'localhost' identified by '1234';

GRANT ALL PRIVILEGES ON * . * TO 'superusuario'@'localhost';

*/

/*

create user 'useracessonebd'@'localhost' identified by '1234';

GRANT all privileges ON acme.* TO 'useracessonebd'@'localhost';

*/

/*
create user 'tabelaespecifica'@'localhost' identified by '1234';

GRANT all privileges ON acme.dependente TO 'tabelaespecifica'@'localhost';

*/

/*
create user 'dmlsemdelete'@'localhost' identified by '1234';

GRANT INSERT, UPDATE ON acme.funcionario TO 'dmlsemdelete'@'localhost';
*/

/*
SELECT user FROM mysql.user;

GRANT all privileges ON *.* TO 'alexandre'@'localhost';
*/

SELECT User, Host FROM mysql.user;


select user, host from mysql.user;

REVOKE ALL, GRANT OPTION FROM marcelo@localhost;









