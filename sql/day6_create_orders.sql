create table if not exists qa_test.orders (
	order_id int auto_increment primary key,
    customer_name varchar(100) not null,
    product_id int not null,
    quantity int not null,
    order_date date not null,
    created_at timestamp default current_timestamp,
    foreign key (product_id) references qa_test.products(product_id)
  );  