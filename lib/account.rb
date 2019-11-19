# frozen_string_literal: true

require 'money'
require_relative 'statement'

class Account
  def initialize
    @balance = BigDecimal('0.00')
    @transactions = []
    @statement = Statement.new
  end

  attr_reader :balance, :transactions

  def current_balance
    '%.2f' % balance
  end

  def deposit(amount)
    add_to_balance(amount)
    record_transaction(amount, nil)
  end

  def withdraw(amount)
    subtract_from_balance(amount)
    record_transaction(nil, amount)
  end

  def print_statement
    @statement.print_statement(transactions)
  end

  private

  def record_transaction(deposit, withdraw)
    transaction = { date: todays_date, credit: deposit, debit: withdraw, balance: current_balance }
    transactions.push(transaction)
  end

  def add_to_balance(amount)
    @balance += BigDecimal(amount)
  end

  def subtract_from_balance(amount)
    @balance -= BigDecimal(amount)
  end

  def todays_date
    time = Time.new
    "#{time.day}/#{time.month}/#{time.year}"
  end
end

# account = Account.new
# account.deposit('2.01')
# account.withdraw('2.01')
# account.print_statement
