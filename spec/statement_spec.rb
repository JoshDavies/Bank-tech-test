# frozen_string_literal: true

require 'account'
require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:account) { Account.new }

  describe '#print_statement' do
    it 'prints an accounts previous deposits & withdrawals (reverse order)' do
      allow(account).to receive(:todays_date).and_return('10/01/2012')
      account.deposit('1000.00')
      allow(account).to receive(:todays_date).and_return('13/01/2012')
      account.deposit('2000.00')
      allow(account).to receive(:todays_date).and_return('14/01/2012')
      account.withdraw('500.00')
      expect do
        account.print_statement
      end.to output("date || credit || debit || balance\n14/01/2012 ||  || 500.00 || 2500.00\n13/01/2012 || 2000.00 ||  || 3000.00\n10/01/2012 || 1000.00 ||  || 1000.00\n").to_stdout
    end
  end
end
