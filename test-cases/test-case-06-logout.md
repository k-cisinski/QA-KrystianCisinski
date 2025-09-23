# Test Case 06 - Logout Functionality

**Test ID:** TC-06
**Module/Area:** User Account - Authentication
**Test Objective:** Verify that iser can succesfully log out.
**Tested URL:** [https://www.amazon.com/]

## Preconditions:
- User has an open web browser.
- User is on the page: [https://www.amazon.com/].

## Steps to Reproduce:
1. Log in as valid user.
2. Click Logout button.

## Expected Results:
- User is redirected to home page and session is ended.
- No console errors appear in DevTools after clicking Search.

## Actual Results:
- User was successfully logged out and redirected to the Amazon page.
- Session ended - user had to log in again to access account features.
- No console errors observed in DevTools after clicking Logout.
- Network request for logout returned HTTP 200.

## Status:
Executed - Passed

## Jira Bug:
N/A - no issues observed