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
      expect(account.current_balance).to eq('2.01')
      expect(account.statement).to eq([
        {:balance=>"2.01", :credit=>"2.01", :date=>"18/11/2019", :debit=>nil}
      ])
      allow(account).to receive(:todays_date).and_return('19/11/2019')
      account.deposit('12.15')
      expect(account.current_balance).to eq('14.16')
      expect(account.statement).to eq([
        {:balance=>"2.01", :credit=>"2.01", :date=>"18/11/2019", :debit=>nil},
        {:balance=>"14.16", :credit=>"12.15", :date=>"19/11/2019", :debit=>nil}
      ])
    end
  end

  describe '#withdraw' do
    it 'minuses an amount to a customers bank balance' do
      allow(account).to receive(:todays_date).and_return('18/11/2019')
      account.withdraw('2.01')
      expect(account.current_balance).to eq('-2.01')
      expect(account.statement).to eq([
        {:balance=>"-2.01", :credit=>nil, :date=>"18/11/2019", :debit=>"2.01"}
      ])
      allow(account).to receive(:todays_date).and_return('19/11/2019')
      account.withdraw('12.15')
      expect(account.current_balance).to eq('-14.16')
      expect(account.statement).to eq([
        {:balance=>"-2.01", :credit=>nil, :date=>"18/11/2019", :debit=>"2.01"},
        {:balance=>"-14.16", :credit=>nil, :date=>"19/11/2019", :debit=>"12.15"}
      ])
    end
  end

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
