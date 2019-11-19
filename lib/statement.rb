# frozen_string_literal: true

class Statement
  def print_statement(transactions)
    puts 'date || credit || debit || balance'
    print_transactions(transactions)
  end

  private

  def print_transactions(transactions)
    transactions.reverse.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end
end
