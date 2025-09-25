-- Select all products
select * from qa_test.products;

-- Select only electronics
select product_name, price from qa_test.products where category = "Electronics";

-- Select produckts out of stock
select product_name from qa_test.products where stock_quantity = 0;
