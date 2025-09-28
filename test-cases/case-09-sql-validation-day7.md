# Day 7 - SQL Validation (Average Product Price)

**Query file:** `sql/day7_extra_queries.sql`
(This file contains 2 queries: lowest stock products and total orders per product.)

---

## Execution instructions:
1. Open MySQL Workbench and connect to your MySQL server.
2. Make sure you are connected to the `qa_test` database.
3. Ensure that `products` and `orders` tables exist and contain data (use Day 5 and Day 6 scripts).
4. Execute the queries from `day7_extra_queries.sql`.
5. For each query compare the results with the **Expected Result** section.

---

## SQL-TC-01: Products with the lowest stock quantity (TOP 5)
**Query:**
```sql
select product_id, product_name, stock_quantity
from qa_test.products
order by stock_quantity asc
limit 5;
```

## Expected Result:
```text
2	Mechanical Keyboard	5
5	Laptop Dell XPS 13	5
1	Wireless Mouse	9
8	Standing Desk 120x60	9
6	IPhone 14	14
```

## Actual Result:
```text
Pending
```

## Status:
- _Pending 

## Jira Bugs:
- _Pending

---

## SQL-TC-02: Total quantity of orders per product (aggregated)
**Query:**
```sql
select p.product_id, p.product_name, coalesce(sum(o.quantity),0) as total_ordered
from qa_test.products p
left join qa_test.orders o
on p.product_id = o.product_id
group by p.product_id, p.product_name
order by total_ordered desc;
```

## Expected Result:
```text
9	Coffee Beans Brazil 1kg	20
5	Laptop Dell XPS 13	3
6	IPhone 14	3
1	Wireless Mouse	2
2	Mechanical Keyboard	1
4	Notebook	0
7	Office Chair Ergonomic	0
8	Standing Desk 120x60	0
```

## Actual Result:
```text
Pending
```

## Status:
- _Pending 

## Jira Bugs:
- _Pending
