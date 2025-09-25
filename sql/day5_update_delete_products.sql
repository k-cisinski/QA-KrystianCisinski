-- Update price of a product
update qa_test.products set price = 49.99 where product_name = 'Wireless Mouse';

-- Update product amount in stock
update qa_test.products set stock_quantity = 100 where product_name = 'Notebook';
update qa_test.products set stock_quantity = stock_quantity - 1 where product_id = 1;

-- Delete a product
SET SQL_SAFE_UPDATES = 0;
delete from qa_test.products where product_name = 'Water Bottle';
SET SQL_SAFE_UPDATES = 1;
