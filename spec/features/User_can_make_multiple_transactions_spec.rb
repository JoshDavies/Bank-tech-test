require 'account'

describe Account do
  let(:account) { Account.new }

  let(:statement_print_out) {
"date || credit || debit || balance
14/01/2012 ||  || 500.00 || 2500.00
13/01/2012 || 2000.00 ||  || 3000.00
10/01/2012 || 1000.00 ||  || 1000.00
"
  }

  it 'allows a user to make multiple transactions' do
    allow(account).to receive(:todays_date).and_return('10/01/2012')
    account.deposit('1000.00')
    allow(account).to receive(:todays_date).and_return('13/01/2012')
    account.deposit('2000.00')
    allow(account).to receive(:todays_date).and_return('14/01/2012')
    account.withdraw('500.00')
    expect do
      account.print_statement
    end.to output(statement_print_out).to_stdout
  end
end
