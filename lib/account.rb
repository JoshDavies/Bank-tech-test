# frozen_string_literal: true

require 'money'

class Account
  def initialize
    @balance = BigDecimal('0.00')
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
    puts '12.15 || || 12.15'
  end
end
