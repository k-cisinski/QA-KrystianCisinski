# Test Case 05 - Add to Cart

**Test ID:** TC-05
**Module/Area:** Shopping Cart - Product Page
**Test Objective:** Verify that user can add an item to the cart.
**Tested URL:** [https://a.co/d/3yWwfaX]

## Preconditions:
- User has an open web browser.
- User is on the page: [https://a.co/d/3yWwfaX].

## Steps to Reproduce:
1. Navigate to product page.
2. Click "Add to Cart" button.

## Expected Results:
- Item is added to the cart and cart count increases.
- No console errors appear in DevTools after clicking Search.

## Actual Results:
- Item was successfully added to the cart (confirmation banner shown).
- Cart count increased by 1.
- **Console tav in DevTools shows 3 third-party network errors (net::ERR_NAME_NOT_RESOLVED) from ad/tracking scripts.**
- No errors related to Add to Cart functionality itself.
- Network request `add-to-cart` returned HTTP 200.

## Status:
Executed - Passed with Observations

## Jira Bug:
[SCRUM-1](https://kcisinski.atlassian.net/browse/SCRUM-1)