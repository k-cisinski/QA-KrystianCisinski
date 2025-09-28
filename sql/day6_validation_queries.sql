-- 1. Total ordered compared to stock per product
select p.product_id, p.product_name, p.stock_quantity, coalesce(sum(o.quantity), 0) as total_ordered, p.stock_quantity - coalesce(sum(o.quantity), 0) as remaining_stock
from qa_test.products p
left join qa_test.orders o
on p.product_id = o.product_id
group by p.product_id, p.product_name, p.stock_quantity
order by remaining_stock desc;

-- 2. Products where total_ordered is higher than stock_quantity
select p.product_id, p.product_name, p.stock_quantity, sum(o.quantity) as total_ordered
from qa_test.products p
join qa_test.orders o
on p.product_id = o.product_id
group by p.product_id, p.product_name, p.stock_quantity
having total_ordered > p.stock_quantity;

-- 3. Orphan orders (orders without product_id in products)
select o.*
from qa_test.orders o
left join qa_test.products p
on o.product_id = p.product_id
where p.product_id is null;

-- 4. Negative or zero quantities in orders
select * from qa_test.orders where quantity <= 0;
