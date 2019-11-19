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
    add_to_balance(amount)
    record_transaction(amount, nil)
  end

  def withdraw(amount)
    subtract_from_balance(amount)
    record_transaction(nil, amount)
  end

  def print_statement
    puts 'date || credit || debit || balance'
    print_transactions
  end
  attr_reader :balance
  private

  def record_transaction(deposit, withdraw)
    transaction = { date: todays_date, credit: deposit, debit: withdraw, balance: current_balance }
    @statement.push(transaction)
  end

  def add_to_balance(amount)
    @balance += BigDecimal(amount)
  end

  def subtract_from_balance(amount)
    @balance -= BigDecimal(amount)
  end

  def print_transactions
    @statement.reverse.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end

  def todays_date
    time = Time.new
    "#{time.day}/#{time.month}/#{time.year}"
  end
end

account = Account.new
account.deposit('14.23')
account.withdraw('4.23')
account.print_statement
p account.balance
