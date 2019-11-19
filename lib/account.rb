# frozen_string_literal: true

require 'money'

class Account
  def initialize
    @balance = BigDecimal('0.00')
    @statement = []
  end

  def current_balance
    '%.2f' % @balance
  end

  def deposit(amount)
    @balance += BigDecimal(amount)
    record_transaction(amount, nil)
  end

  def withdraw(amount)
    @balance -= BigDecimal(amount)
    record_transaction(nil, amount)
  end

  def print_statement
    puts 'credit || debit || balance'
    transactions
  end

  private

  def record_transaction(deposit, withdraw)
    transaction = { credit: "#{deposit}", debit: "#{withdraw}", balance: "#{current_balance}" }
    @statement.push(transaction)
  end

  def transactions
    @statement.reverse.each do |transaction|
      puts "#{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end
end

account = Account.new
account.deposit('14.23')
account.deposit('1.31')
account.withdraw('3.28')
account.print_statement
