# Day 8 - Data Validation Bug Reproduction Test Cases

**Evidence files (examples):**
- `sql/exports/day8_total_ordered_vs_stock.csv`
- `sql/exports/day8_total_ordered_vs_stock_with_bug.csv`
- `sql/exports/day8_orphan_orders.csv`
- `sql/exports/day8_orphan_orders_with_bug.csv`
- `sql/exports/day8_negative_quantities.csv`
- `sql/exports/day8_negative_quantities_with_bug.csv`
- `assets/screenshots/day8/total_ordered_vs_stock.png`
- `assets/screenshots/day8/total_ordered_vs_stock_with_bug.png`
- `assets/screenshots/day8/orphan_orders.png`
- `assets/screenshots/day8/orphan_orders_with_bug.png`
- `assets/screenshots/day8/negative_quantities.png`
- `assets/screenshots/day8/negative_quantities_with_bug.png`

---

## Execution instructions:

1. Checkout branch for Day 8 work:
```bash
git checkout -b day-8-bug-reporting
```

2. Prepare baseline: execute Day5 & Day6 scripts if not already done:
- `sql/day5_create_products.sql` (creating `products` table)
- `sql/day5_insert_products.sql` (inserting data to `products` table)
- `sql/day5_update_delete_products.sql` (updating data inside `products` table)
- `sql/day6_create_orders.sql` (creating `orders` table)
- `sql/day6_insert_orders.sql` (inserting data to `orders` table)

3. Run baseline validation queries and export results to CSV (store under `sql/exports/`).

4. Reproduce bugs using provided SQL snippets.

5. Fill Actual Result and Status below and create Jira Issues for failing tests; paste Jira links under Jira Bugs.

6. After saving evidence and creating Jira tickets, rollback test rows (delete `BUG_TEST_%` entries) and export "after-fix" baselines.

---

## SQL-TC-01: Over-order - total_ordered > stock (Reproduction)

**Purpose:** Verify validation detects when total ordered quantity for product exceeds stock.

**Reproduction Query (check single product):**
```sql
SELECT p.product_id, p.product_name, p.stock_quantity,
       COALESCE(SUM(o.quantity),0) AS total_ordered
FROM qa_test.products p
LEFT JOIN qa_test.orders o ON p.product_id = o.product_id
WHERE p.product_id = 9
GROUP BY p.product_id, p.product_name, p.stock_quantity;
```

**Action performed to reproduce:**
```sql
-- damaging product with id 9: adding order so total_ordered > stock
insert into qa_test.orders (customer_name, product_id, quantity, order_date)
values ('BUG_TEST_OVERORDER', 9, 31, NOW());
```

**Validation query:**
```sql
-- Total ordered vs stock
SELECT 
    p.product_id,
    p.product_name,
    p.stock_quantity,
    COALESCE(SUM(o.quantity), 0) AS total_ordered,
    p.stock_quantity - COALESCE(SUM(o.quantity), 0) AS remaining_stock
FROM
    qa_test.products p
        LEFT JOIN
    qa_test.orders o ON p.product_id = o.product_id
GROUP BY p.product_id , p.product_name , p.stock_quantity
ORDER BY remaining_stock ASC;
```

## Expected Result:
No results with `remaining_stock` below 0.

## Actual Result:
```text
MINGW64 ~/Documents/GitHub/Projects/QA-KrystianCisinski (day-8-bug-reporting)
$ head -n 12 sql/exports/day8_total_ordered_vs_stock_with_bug.csv
product_id,product_name,stock_quantity,total_ordered,remaining_stock
9,"Coffee Beans Brazil 1kg",50,51,-1
5,"Laptop Dell XPS 13",5,3,2
2,"Mechanical Keyboard",5,1,4
1,"Wireless Mouse",9,2,7
8,"Standing Desk 120x60",9,0,9
6,"IPhone 14",14,3,11
7,"Office Chair Ergonomic",20,0,20
4,Notebook,50,0,50
``` 

## Status:
- Executed - Failed 

## Jira Bugs:
- SCRUM-2 - https://kcisinski.atlassian.net/browse/SCRUM-2 

---

## SQL-TC-02: Orphan orders (orders referencing non-existing product_id)

**Purpose:** Detect orders that reference a product_id not present in products table.

**Reproduction action (if FK disabled during insert):**
```sql
 -- Adding order without existing id
 SET FOREIGN_KEY_CHECKS = 0;
 
 insert into qa_test.orders (customer_name, product_id, quantity, order_date)
 values ('BUG_TEST_ORPHAN', 9999, 1, NOW());
 
  SET FOREIGN_KEY_CHECKS = 1;
```

**Validation query:**
```sql
  -- orphan orders
SELECT 
    o.*
FROM
    qa_test.orders o
        LEFT JOIN
    qa_test.products p ON o.product_id = p.product_id
WHERE
    p.product_id IS NULL;
```

## Expected Result:
No rows being returned - every order.product_id should exist in products.

## Actual Result:
```text
MINGW64 ~/Documents/GitHub/Projects/QA-KrystianCisinski (day-8-bug-reporting)
$ head -n 12 sql/exports/day8_orphan_orders_with_bug.csv
order_id,customer_name,product_id,quantity,order_date,created_at
11,BUG_TEST_ORPHAN,9999,1,2025-10-05,"2025-10-05 19:14:39"
``` 

## Status:
- Executed - Failed 

## Jira Bugs:
- SCRUM-3 - https://kcisinski.atlassian.net/browse/SCRUM-3 

---

## SQL-TC-03: Negative or zero quantities in orders

**Purpose:** Ensure no orders have quantity <= 0.

**Reproduction action:**
```sql
-- Inserting row with '0' & <0 value
insert into qa_test.orders (customer_name, product_id, quantity, order_date)
values ('BUG_TEST_ZERO_Q', 1, 0, NOW()), ('BUG_TEST_NEG_Q', 2, -5, NOW());
```

**Validation query:**
```sql
-- negative or zero quantities
SELECT 
    *
FROM
    qa_test.orders
WHERE
    quantity <= 0;
```

## Expected Result:
No rows being returned - quantity must be > 0.

## Actual Result:
```text
MINGW64 ~/Documents/GitHub/Projects/QA-KrystianCisinski (day-8-bug-reporting)
$ head -n 12 sql/exports/day8_negative_quantities_with_bug.csv
order_id,customer_name,product_id,quantity,order_date,created_at
8,BUG_TEST_ZERO_Q,1,0,2025-10-05,"2025-10-05 18:52:19"
9,BUG_TEST_NEG_Q,2,-5,2025-10-05,"2025-10-05 18:52:19"
``` 

## Status:
- Executed - Failed

## Jira Bugs:
- SCRUM-4 - https://kcisinski.atlassian.net/browse/SCRUM-4 
