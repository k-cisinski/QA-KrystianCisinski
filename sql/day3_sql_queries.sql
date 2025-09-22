-- day3_sql_queries.sql (Sakila)

-- sample rows for sakila.actor inspection (limit)
select * from sakila.actor limit 10;

-- Test 1: Verify actor 'PENELOPE' exists
select * from sakila.actor where first_name = 'PENELOPE';
-- Test 2: Verify which actors names begins with letter "K"
select actor_id, first_name, last_name from sakila.actor where lower(first_name) like 'k%';
-- Test 3: Verify actors count with their last names ending with letter "y"
select count(*) as last_name_ends_with_y from sakila.actor where lower(last_name) like '%y';

-- sample rows for sakila.customer inspection (limit)
select * from sakila.customer limit 10;

-- Test 4: Verify customer count
select count(*) as customer_count from sakila.customer;
-- Test 5: Verify unique store 1 customer count 
select count(distinct customer_id) as unique_store_1_customers from sakila.customer where store_id = 1;

-- sample rows for sakila.film inspection (limit)
select * from sakila.film limit 10;

-- Test 6: Verify films with 'action' in title (case-insensitive)
select film_id, title from sakila.film where lower(title) like '%action%';
-- Test 7: Verify films count with 'dog' in description (case-insensitive)
select count(*) as films_with_dogs from sakila.film where lower(description) like '%dog%';