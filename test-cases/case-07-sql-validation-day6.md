# Day 6 - SQL Advanced + Data Validation

**Query file:** `sql/day6_sql_validation.sql`
(This file contains 4 validation queries for products and orders.)

---

## Execution instructions
1. Open MySQL Workbench and connect to your MySQL server.
2. Make sure you are connected to the `qa_test` database.
3. Prepare the database to the correct initial state for Day 6:
	- Execute `day5_create_products.sql` to create the `products` table.
	- Execute `day5_insert_products.sql` to populate the `products` table with initial data.
	- Execute `day5_update_delete_products.sql` to apply the updates and deletions from Day 5 exercises.
4. Create and populate the `orders` table:
	- Execute `day6_create_orders.sql` to create the `orders` table.
	- Execute `day6_insert_orders.sql` to insert sample order data.
5. Once the database is prepared, execute the validation queries in this test case:
	- Total ordered compared to stock per product
	- Products where total_ordered is higher than stock_quantity
	- Orphan orders (orders without product_id in products)
	- Negative or zero quantities in orders
6. For each query, check the **Actual Result**.

---

## SQL-TC-01: Total ordered compared to stock per product
**Query:**
```sql
select p.product_id, p.product_name, p.stock_quantity, coalesce(sum(o.quantity), 0) as total_ordered, p.stock_quantity - coalesce(sum(o.quantity), 0) as remaining_stock
from qa_test.products p left join qa_test.orders o on p.product_id = o.product_id
group by p.product_id, p.product_name, p.stock_quantity
order by remaining_stock desc;
```

## Expected Result:
```text
4	Notebook	50	0	50
9	Coffee Beans Brazil 1kg	50	20	30
7	Office Chair Ergonomic	20	0	20
6	IPhone 14	14	3	11
8	Standing Desk 120x60	9	0	9
1	Wireless Mouse	9	2	7
2	Mechanical Keyboard	5	1	4
5	Laptop Dell XPS 13	5	3	2
```

## Actual Result:
- _Pending - To be filled after execution

## Status:
- Pending

## Jira Bugs:
- Pending

---

## SQL-TC-02: Products where total_ordered is higher than stock_quantity
**Query:**
```sql
select p.product_id, p.product_name, p.stock_quantity, sum(o.quantity) as total_ordered
from qa_test.products p join qa_test.orders o on p.product_id = o.product_id
group by p.product_id, p.product_name, p.stock_quantity
having total_ordered > p.stock_quantity;

```

## Expected Result:
- No records were found for this query.

## Actual Result:
- _Pending - To be filled after execution

## Status:
- Pending

## Jira Bugs:
- Pending

---

## SQL-TC-03: Orphan orders
**Query:**
```sql
select o.*
from qa_test.orders o left join qa_test.products p on o.product_id = p.product_id
where p.product_id is null;
```

## Expected Result:
- No records were found for this query.

## Actual Result:
- _Pending - To be filled after execution

## Status:
- Pending

## Jira Bugs:
- Pending

---

## SQL-TC-04: Negative or zero quantities in orders
**Query:**
```sql
select * from qa_test.orders where quantity <= 0;
```

## Expected Result:
- The query returned only NULL values.

## Actual Result:
- _Pending - To be filled after execution

## Status:
- Pending

## Jira Bugs:
- Pending