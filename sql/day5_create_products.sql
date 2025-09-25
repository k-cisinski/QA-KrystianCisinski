-- Create products table for Day 5 SQL exercises

create table if not exists qa_test.products (
	product_id int auto_increment primary key,
	product_name varchar(100),
	category varchar(50),
	price decimal(10,2),
	stock_quantity int,
	created_at timestamp default current_timestamp
);

