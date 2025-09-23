# Test Case 04 - Search Functionality

**Test ID:** TC-04
**Module/Area:** Search Module - Homepage
**Test Objective:** Verify that the search bar returns relevant results.
**Tested URL:** [https://google.com/]

## Preconditions:
- User has an open web browser.
- User is on the page: [https://google.com/]

## Steps to Reproduce:
1. Navigate to homepage.
2. Enter "test" in search bar.
3. Click "Search" button.

## Expected Results:
- List of items containing "test" is displayed.
- No console errors appear in DevTools after clicking Search.

## Actual Results:
- Search results page displayed with multiple relevant results for "test".
- No red errors found in Console tab of DevTools.
- Network request `search?q-test` returned HTTP 200.

## Status:
Executed - Passed

## Jira Bug:
N/A - no bug found during test execution.