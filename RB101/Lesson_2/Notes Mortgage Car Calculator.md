# Assignment: Mortgage / Car Loan Calculator

## Understand the problem

Examples and Test Cases

### Understand the problem
#### Set up your test cases
  - I need to use valid numbers meaning
    - No negative number? is that an assumption?
    - floats vs integers
    - percentage rate, if I ask them to type in just the rate then I must convert the percentage to a decimal value (it is possible both values are floats ie 1.1% = 0.011)

#### Describe your inputs, outputs, and data structures
  - inputs
    - Inputs are going to be floats or integers
      - the loan amount (in dollars)
        cannot be 0
        cannot be negative
      - the Annual Percentage Rate (APR) (in percentage)
        - convert Percentage to decimal

        - **We need to convert the APR to monthly interest rate so (APR/12 months)**
      - the loan duration (in months)
  - outputs
    - monthly interest rate
    - loan duration in months
      - some kind of way to capture years vs months?

#### Data Structure
    - M = P ( J / ( 1 - ( 1 + J ) ** ( -n ) ) )
      - m = monthly payment
      - p = loan amount
      - j = monthly interest rate
        - J = APR / 12.0
      - n = loan duration in months
- Describe your algorithm
- Begin coding
