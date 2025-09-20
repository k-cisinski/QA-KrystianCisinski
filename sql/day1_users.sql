create database qa_test;
use qa_test;

create table users (
	id int auto_increment primary key,
    name varchar(50),
    email varchar(100)
);

insert into users (name, email)
values ('Alice', 'alice@example.com'), ('Bob', 'bob@example.com');

select * from users;