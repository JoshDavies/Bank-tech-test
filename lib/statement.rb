# frozen_string_literal: true

# print out an accounts previous transaction history.
class Statement
  def print_statement(transactions)
    puts 'date || credit || debit || balance'
    print_transactions(transactions)
  end

  private

  def print_transactions(transactions)
    transactions.reverse.each do |transaction|
      date = transaction[:date]
      credit = transaction[:credit]
      debit = transaction[:debit]
      balance = transaction[:balance]
      puts "#{date} || #{credit} || #{debit} || #{balance}"
    end
  end
end
