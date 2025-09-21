# Day 2 API Test: GET /users

**Test ID:** API-TC-01
**Module/Area:** Users API
**Test Objective:** Verify that GET /users endpoint returns a valid response with a list of users.
**Testes URL:** https://jsonplaceholder.typicode.com/users
**Method:** GET

## Preconditions:
- Postman is installed and open
- Internet connection is available

## Steps to Reproduce:
1. Open Postman and create a new request in collection `Day 2 API Tests`.
2. Set request URL to `https://jsonplaceholder.typicode.com/users`.
3. Set method to GET.
4. Click Send.

## Expected Results:
- HTTP Status code 200 OK
- JSON response contains an array of users
- Each user object has fields: 
	- `id`, `name`, `username`, `email`
	- `address` object with: `street`, `suite`, `city`, `zipcode`, `geo` (`lat`, `lng`)
	- `phone`
	- `website`
	- `company` object with: `name`, `catchPhrase`, `bs`

## Actual Results:
- HTTP Status: 200 OK
- JSON response returned 10 users
- Each user object contains all expected fields: 
	- `id`, `name`, `username`, `email`
	- `address` object with: `street`, `suite`, `city`, `zipcode`, `geo` (`lat`, `lng`)
	- `phone`
	- `website`
	- `company` object with: `name`, `catchPhrase`, `bs`

## Status:
Executed - Passed

## Notes:
- Raw JSON response saved as `postman/day2_users_api_response.json` for reference
