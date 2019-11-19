# frozen_string_literal: true

require 'statement'

describe Statement do

  let(:statement) { Statement.new }

  let(:transactions) {[
    {:date=>"19/11/2019", :credit=>"1000.00", :debit=>nil, :balance=>"1000.00"},
    {:date=>"19/11/2019", :credit=>"2000.00", :debit=>nil, :balance=>"3000.00"},
    {:date=>"19/11/2019", :credit=>nil, :debit=>"500.00", :balance=>"2500.00"}
  ]}

  let(:statement_print_out) {
"date || credit || debit || balance
19/11/2019 ||  || 500.00 || 2500.00
19/11/2019 || 2000.00 ||  || 3000.00
19/11/2019 || 1000.00 ||  || 1000.00
"}

  describe '#print_statement' do
    it 'prints an accounts previous deposits & withdrawals (reverse order)' do
      expect do
        statement.print_statement(transactions)
      end.to output(statement_print_out).to_stdout
    end
  end
end
