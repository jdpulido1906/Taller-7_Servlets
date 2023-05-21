create database CarUnity;
use CarUnity;
create table users_tbl(
user_id int not null primary key auto_increment,
user_firstname VARCHAR(40) not null,
user_lastname VARCHAR(40) not null,
user_email VARCHAR(60) not null,
user_password VARBINARY(256)
);
select* from users_tbl;
select* from category_tbl;
select* from product_tbl;
create table category_tbl(
category_id int not null primary key auto_increment,
category_name VARCHAR(40) not null
);
create table product_tbl(
product_id int not null primary key auto_increment,
product_name VARCHAR(40) not null,
product_value int null,
category_id int not null
);


alter table product_tbl 
add constraint category_id
foreign key (category_id)
references category_tbl (category_id);

			
INSERT INTO CarUnity.users_tbl (user_firstname, user_lastname, user_email, user_password) 
VALUES (UPPER('nombres'), UPPER('apellidos'), 'buzon@correo.com',AES_ENCRYPT
('password', '$2a$12$Jea.ZfUxizSY2/HH9JO7aOVBw2.28uQBWD1C9hk7XAYTiIZx5hDLa'));
INSERT INTO CarUnity.users_tbl (user_firstname, user_lastname, user_email, user_password) 
VALUES (UPPER('Andrea'), UPPER('Vera'), 'veraandrea12@gmail.com',AES_ENCRYPT
('aprendizsena', '$2a$12$Jea.ZfUxizSY2/HH9JO7aOVBw2.28uQBWD1C9hk7XAYTiIZx5hDLa'));

SELECT *, CAST(AES_DECRYPT(user_password, '$2a$12$Jea.ZfUxizSY2/HH9JO7aOVBw2.28uQBWD1C9hk7XAYTiIZx5hDLa') 
AS CHAR(50)) end_data FROM users_tbl WHERE user_id = 2;

						