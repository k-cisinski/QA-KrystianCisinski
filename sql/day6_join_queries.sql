-- Join orders + products
select o.order_id, o.customer_name, p.product_name, p.category, o.quantity, p.price, (o.quantity * p.price) as line_total, o.order_date
from qa_test.orders o join qa_test.products p
on o.product_id = p.product_id;

-- Filter: Electronics orders
select o.order_id, o.customer_name, p.product_name, p.category, o.quantity, o.order_date
from qa_test.orders o join qa_test.products p
on o.product_id = p.product_id
where p.category = 'Electronics'
order by o.order_id;

-- Aggregation: total quantity and revenue per product
select p.product_id, p.product_name, 
sum(o.quantity) as total_ordered, 
sum(o.quantity * p.price) as total_revenue
from qa_test.products p
left join qa_test.orders o 
on p.product_id = o.product_id
group by p.product_id, p.product_name
having total_ordered > 0
order by total_revenue desc;

-- Top customers ordered by count
select o.customer_name, count(*) as orders_count,
sum(o.quantity * p.price) as total_spent
from qa_test.orders o
join qa_test.products p
on o.product_id = p.product_id
group by o.customer_name
order by orders_count desc
limit 10;

-- Top customers ordered by total amount spent
select o.customer_name, count(*) as order_count,
sum(o.quantity * p.price) as total_spent
from qa_test.orders o
join qa_test.products p
on o.product_id = p.product_id
group by o.customer_name
order by total_spent desc
limit 10;

-- Recent orders
select o.order_id, o.customer_name, p.product_name, o.quantity, o.order_date
from qa_test.orders o
join qa_test.products p
on o.product_id = p.product_id
order by o.order_date desc
limit 20;