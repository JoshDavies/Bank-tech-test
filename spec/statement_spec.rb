# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  let(:transactions) do
    [
      { date: '10/01/2012', credit: '1000.00', debit: nil, balance: '1000.00' },
      { date: '13/01/2012', credit: '2000.00', debit: nil, balance: '3000.00' },
      { date: '14/01/2012', credit: nil, debit: '500.00', balance: '2500.00' }
    ]
  end

  let(:statement_print_out) do
"date || credit || debit || balance
14/01/2012 ||  || 500.00 || 2500.00
13/01/2012 || 2000.00 ||  || 3000.00
10/01/2012 || 1000.00 ||  || 1000.00\n"
  end

  describe '#print_statement' do
    it 'prints an accounts previous deposits & withdrawals (reverse order)' do
      expect do
        statement.print_statement(transactions)
      end.to output(statement_print_out).to_stdout
    end
  end
end
