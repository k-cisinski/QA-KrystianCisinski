-- Day 7 - EXtra Queries

-- 1. Products with the lowest stock quantity (TOP 5)
select product_id, product_name, stock_quantity
from qa_test.products
order by stock_quantity asc
limit 5;

-- 2. Total quantity of orders per product (aggregated)
select p.product_id, p.product_name, coalesce(sum(o.quantity),0) as total_ordered
from qa_test.products p
left join qa_test.orders o
on p.product_id = o.product_id
group by p.product_id, p.product_name
order by total_ordered desc;
