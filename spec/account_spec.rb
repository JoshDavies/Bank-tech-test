# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }

  describe '#current_balance' do
    it 'keeps track of a customers bank balance' do
      expect(account.current_balance).to eq('0.00')
    end
  end

  describe '#deposit' do
    it 'adds an amount to a customers total bank balance' do
      allow(account).to receive(:todays_date).and_return('18/11/2019')
      account.deposit('2.01')
      allow(account).to receive(:todays_date).and_return('19/11/2019')
      account.deposit('12.15')
      expect(account.transactions).to eq(
        [
          { balance: '2.01', credit: '2.01', date: '18/11/2019', debit: nil },
          { balance: '14.16', credit: '12.15', date: '19/11/2019', debit: nil }
        ]
      )
    end
  end

  describe '#withdraw' do
    it 'minuses an amount to a customers bank balance' do
      allow(account).to receive(:todays_date).and_return('18/11/2019')
      account.withdraw('2.01')
      allow(account).to receive(:todays_date).and_return('19/11/2019')
      account.withdraw('12.15')
      expect(account.transactions).to eq(
        [
          { balance: '-2.01', credit: nil, date: '18/11/2019', debit: '2.01' },
          { balance: '-14.16', credit: nil, date: '19/11/2019', debit: '12.15' }
        ]
      )
    end
  end

  describe '#print_statement' do
    it 'prints an accounts previous deposits & withdrawals (reverse order)' do
      statement = double('statement')
      account = described_class.new(statement)
      column_header = 'date || credit || debit || balance'
      allow(statement).to receive(:print_statement).and_return(column_header)
      expect(account.print_statement).to eq(column_header)
    end
  end
end
