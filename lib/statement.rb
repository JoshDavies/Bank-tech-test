# frozen_string_literal: true

class Statement
  def print_statement(statement)
    puts 'date || credit || debit || balance'
    print_transactions(statement)
  end

  private

  def print_transactions(statement)
    statement.reverse.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end
end
