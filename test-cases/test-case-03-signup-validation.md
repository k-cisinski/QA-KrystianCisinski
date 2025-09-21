# Test Case 03 - Signup Form Validation

**Test ID:** TC-03
**Module/Area:** Registration / Signup
**Test Objective:** Verify validation messages and required fields on the signup form.
**Tested URL:** https://demoqa.com/automation-practice-form

## Preconditions:
- User has a web browser open.
- User is on the signup page: https://demoqa.com/automation-practice-form

## Steps to Reproduce:
1. Navigate to the signup page.
2. Leave all required fields empty and click "Submit".
3. Enter invalid email format and click "Submit".
4. Fill all required fields correctly and click "Submit".

## Expected Results:
- Step 2: Validation messages are displayed for required fields.
- Step 3: Validation message for invalid email format appears.
- Step 4: Form submits succesfully without errors.

## Actual Results:
- Step 2: Some optional fields highlighted in green, required fields highlighted in red.
- Step 3: When invalid email is entered, the email field changes it's highlight from green to red, indicating invalid format.
- Step 4: After filling all required fields correctly and clicking "Submit", the form is submitted succesfully and a summary of the entered data is displayed.

## Status:
Executed - Passed (form behaves as designed)
