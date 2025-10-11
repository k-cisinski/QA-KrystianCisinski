# Day 9 - Local JSON Server & Postman Tests

## Objective
Learning how to work with local REST API using `json-server` and testing endpoints in `Postman`.

---

## Configuration

### Server startup
In `postman/` directory:
```bash
json-server --watch day9_db.json --port 3000
```
API avaiable under:
```text
http://localhost:3000/products
```

---

## Tests in Postman:

### Tested endpoints
1. GET /products - list of all products.
2. GET /products/:id - details about product.
3. POST /products - adding new product.
4. PUT /products/:id - update product.
5. DELETE /products/:id - delete product.

### Used Collections:
- day9_collection.json
- day9_environment.json

### Results saved id:
- day9_postman_test_run_results.json

---

## Results
- Local API based on json-server
- Complete collection of tests in `Postman`
- Auto-saving `productId` after `POST`
- Correct assertions of statuses and answer types
