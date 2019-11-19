# Bank-tech-test

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> rspec # Run the tests to ensure it works

> irb # to interact with the code via an IRB REPL.
```

```bash
> require './lib/account.rb' # require the file
> account = Account.new # create a new account
> account.deposit('1.00') # to make a deposit
> account.withdraw('1.00') # to make a withdrawal
> account.current_balance # to see the accounts balance
> account.print_statement # to print out the accounts full transaction history
> exit # to quit

```


----------
## User Stories

```
as a new user
I want to create an account that tracks my current bank balance to the penny.

as an account holder
I want to be able to make a deposit

as an account holder
I want to be able to make a withdrawal

as an account holder
I want to view a print out of my history of previous deposits and withdrawals (reverse order)

as an account holder
i want to see the date when each transaction was made.

As an admin
to avoid tampering or accidental miss-use of the program
logic must be private

```
## Class Diagram (UML)
### Objects:
- Account. transaction = { date: , credit: , debit: , balance: }
- Statement

### Messages:
- current_balance
- deposit (amount)
- withdraw (amount)
- print_statement (transactions)

-------------
### Acceptance criteria

  **Given** a client makes a deposit of 1000 on 10-01-2012  
  **And** a deposit of 2000 on 13-01-2012  
  **And** a withdrawal of 500 on 14-01-2012  
  **When** she prints her bank statement  
  **Then** she would see

  ```
  date || credit || debit || balance
  14/01/2012 || || 500.00 || 2500.00
  13/01/2012 || 2000.00 || || 3000.00
  10/01/2012 || 1000.00 || || 1000.00
  ```
