# Day 3 - SQL Test Cases (Sakila db)

**Query file:** `sql/day3_sql_queries.sql`
(This file contains: sample rows and Test 1 - 7)

---

## Execution instructions
1. Open MySQL Workbench and connect to your MySQL server.
2. Open the file `sql/day3_sql_queries.sql`.
3. Execute queries one by one (first the sample rows, then the tests).
4. For each test, copy a short result and paste it into the **Actual Result** section below (copy 1-10 rows or a COUNT result).
5. Update **Status**: `Executed - Passed` or `Executed - Failed` (if result differs from expectation).
6. Commit/push your changes on branch `day-3-sql` and create a PR to `main`.

---

## SQL-TC-01: Verify actor 'PENELOPE' exists
**Query:**
```sql
SELECT * FROM sakila.actor WHERE first_name = 'PENELOPE';
```

## Expected Result:
```text
1	PENELOPE	GUINESS	2006-02-15 04:34:33
54	PENELOPE	PINKETT	2006-02-15 04:34:33
104	PENELOPE	CRONYN	2006-02-15 04:34:33
120	PENELOPE	MONROE	2006-02-15 04:34:33
```

## Actual Result:
```text
1	PENELOPE	GUINESS	2006-02-15 04:34:33
54	PENELOPE	PINKETT	2006-02-15 04:34:33
104	PENELOPE	CRONYN	2006-02-15 04:34:33
120	PENELOPE	MONROE	2006-02-15 04:34:33
```

## Status:
- Executed - Passed

## SQL-TC-02: Verify which actors' first names begin with "K"
**Query:**
```sql
SELECT actor_id, first_name, last_name FROM sakila.actor WHERE lower(first_name) LIKE 'k%';
```

## Expected Result:
```text
12	KARL	BERRY
21	KIRSTEN	PALTROW
25	KEVIN	BLOOM
43	KIRK	JOVOVICH
69	KENNETH	PALTROW
88	KENNETH	PESCI
92	KIRSTEN	AKROYD
94	KENNETH	TORN
127	KEVIN	GARLAND
145	KIM	ALLEN
169	KENNETH	HOFFMAN
```

## Actual Result:
```text
12	KARL	BERRY
21	KIRSTEN	PALTROW
25	KEVIN	BLOOM
43	KIRK	JOVOVICH
69	KENNETH	PALTROW
88	KENNETH	PESCI
92	KIRSTEN	AKROYD
94	KENNETH	TORN
127	KEVIN	GARLAND
145	KIM	ALLEN
169	KENNETH	HOFFMAN
```

## Status:
- Executed - Passed

## SQL-TC-03: Verify actors count with last names ending with "y"
**Query:**
```sql
SELECT COUNT(*) AS last_name_ends_with_y FROM sakila.actor WHERE LOWER(last_name) LIKE '%y';
```

## Expected Result:
```text
17
```

## Actual Result:
```text
17
```

## Status:
- Executed - Passed

## SQL-TC-04: Verify customer count
**Query:**
```sql
SELECT COUNT(*) AS customer_count FROM sakila.customer;
```

## Expected Result:
```text
599
```

## Actual Result:
```text
599
```

## Status:
- Executed - Passed

## SQL-TC-05: Verify unique store 1 customer count
**Query:**
```sql
SELECT COUNT(DISTINCT customer_id) AS unique_store_1_customers FROM sakila.customer WHERE store_id = 1;
```

## Expected Result:
```text
326
```

## Actual Result:
```text
326
```

## Status:
- Executed - Passed

## SQL-TC-06: Verify films with 'action' in title (case-insensitive)
**Query:**
```sql
SELECT film_id, title FROM sakila.film WHERE LOWER(title) LIKE '%action%';
```

## Expected Result:
```text
45	ATTRACTION NEWTON
287	ENTRAPMENT SATISFACTION
763	SATISFACTION CONFIDENTIAL
881	TEMPLE ATTRACTION
```

## Actual Result:
```text
45	ATTRACTION NEWTON
287	ENTRAPMENT SATISFACTION
763	SATISFACTION CONFIDENTIAL
881	TEMPLE ATTRACTION
```

## Status:
- Executed - Passed

## SQL-TC-07: Verify films count with 'dog' in description (case-insensitive)
**Query:**
```sql
SELECT COUNT(*) AS films_with_dogs FROM sakila.film WHERE LOWER(description) LIKE '%dog%';
```

## Expected Result:
```text
99
```

## Actual Result:
```text
99
```

## Status:
- Executed - Passed
