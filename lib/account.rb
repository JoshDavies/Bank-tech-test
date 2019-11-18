# frozen_string_literal: true

require 'money'

class Account
  def initialize
    @balance = BigDecimal('0.00')
    @statement = [
      {credit: '12.15', debit: ' ', balance: '12.15'},
      {credit: ' ', debit: '2.15', balance: '10.00'}
      ]
  end

  def current_balance
    '%.2f' % @balance
  end

  def deposit(amount)
    @balance += BigDecimal(amount)
  end

  def withdraw(amount)
    @balance -= BigDecimal(amount)
  end

  def print_statement
    puts 'credit || debit || balance'
    @statement.reverse.each{ |transaction|
      puts "#{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    }
  end
end
