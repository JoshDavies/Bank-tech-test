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
    transaction = { credit: "#{amount}", balance: "#{current_balance}" }
    @statement.push(transaction)
    p @statement
  end

  def withdraw(amount)
    @balance -= BigDecimal(amount)
    transaction = { debit: "#{amount}", balance: "#{current_balance}" }
    @statement.push(transaction)
  end

  def print_statement
    puts 'credit || debit || balance'
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
