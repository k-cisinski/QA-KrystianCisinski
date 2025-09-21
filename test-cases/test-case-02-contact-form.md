# Test Case 02 - Contact Form Submission

**Test ID:** TC-02
**Module/Area:** Contact Form
**Test Objective:** Verify that the contact form can be submitted and validates required fields properly.
**Tested URL:** https://demoqa.com/text-box

## Preconditions:
- User has a web browser open.
- User is on tje contact form page: https://demoqa.com/text-box

## Steps to Reproduce:
1. Navigate to the contact form page.
2. Leave all fields empty and click "Submit".
3. Enter only name, leave other fields empty, click "Submit".
4. Enter valid name, email, current address and permanent address, then click "Submit".

## Expected Results:
- Step 2: Validation messages are displayed for required fields.
- Step 3: Valitadion messages still show for missing fields.
- Step 4: Form submits succesfully and entered data is displayed.

## Actual Results:
- Step 2: No validation messages are displayed for required fields; nothing happens.
- Step 3: Email field highlighted in red; data not updated below.
- Step 4: Entered data displayed below form.

## Status:
Executed - Failed (validation messages missing)
