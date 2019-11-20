# frozen_string_literal: true

require 'money'
require_relative 'statement'

# Track a users bank account transactions.
class Account
  def initialize(statement = Statement.new)
    @balance = BigDecimal('0.00')
    @transactions = []
    @statement = statement
  end

  attr_reader :balance, :transactions

  def current_balance
    format('%0.2f', balance)
  end

  def deposit(amount)
    valid_input?(amount)
    add_to_balance(amount)
    record_transaction(amount, nil)
  end

  def withdraw(amount)
    valid_input?(amount)
    subtract_from_balance(amount)
    record_transaction(nil, amount)
  end

  def print_statement
    @statement.print_statement(transactions)
  end

  private

  def record_transaction(deposit, withdraw)
    transaction = {
      date: todays_date,
      credit: deposit,
      debit: withdraw,
      balance: current_balance
    }
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

  def valid_input?(amount)
    return unless amount.to_f.negative? || amount.count('a-zA-Z').positive?
    raise StandardError.new 'Invalid Input'
  end
end
