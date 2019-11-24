# Bank-tech-test
A back-end program that tracks and prints out an account holders bank transactions.

## Quickstart
First, clone this repository. Then:

```bash
> bundle install
> rspec # Run the tests to ensure it works

> irb # to interact with the code via an IRB REPL.
```

```bash
# irb
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
- Account. @statement{ transaction = { date: , credit: , debit: , balance: } }
- Printer / Display

### Messages:
- current_balance
- deposit (amount)
- withdraw (amount)
- print_statement (transactions)

-------------
## Acceptance criteria

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

  ![Screenshot](https://github.com/JoshDavies/Bank-tech-test/blob/master/Screenshot%202019-11-20%20at%2010.50.22%20(2).png?raw=true)

### Solution Design Approach
I outlined a basic plan, using User Stories to break down the approach into small steps and guide me towards realising the full functionality.
From the user stories I identified objects and messages and used them to form a basic class diagram.

### Code Structure
I allowed TDD to naturally guide the structure the program. Extracting the 'Printer' class from 'Account' when it grew too big.
Once tests were passing I refactored and extracted logic from the top level, hiding it within private methods.
The abstraction also makes the classes functionality easier to read.

### Reflection
'Account' class has just grown to the point it is worth considering extracting another class from it. Perhaps separating the task of handling transactions and the task of recording / storing them all.  

The necessity of using 'BigDecimal' is debatable for this challenge, since the criteria does not explicitly require the ability to handle decimal sums.
However, normal binary floating point arithmetic introduces errors because of the conversion between base 10 and base 2.  
e.g. 1.2 - 1.1 => 0.09999999999999987  
BigDecimal guards against such edge cases.

The 'Printer' class was originally called 'Statement' but was changed to better reflect the classes functionality.
(As the class does not store the data, it only prints to the terminal.)  

The next step will be to remove the 'attr_reader', as I realise it unnecessarily exposes the 'transaction' and 'balance' instance variables for test purposes.
The tests should test behaviour rather than changes in state!
