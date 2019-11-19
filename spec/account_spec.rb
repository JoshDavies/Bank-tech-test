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
    it 'adds an amount to a customers bank balance' do
      account.deposit('2.01')
      expect(account.current_balance).to eq('2.01')
    end
    it 'can make multiple deposits' do
      account.deposit('2.01')
      account.deposit('12.15')
      expect(account.current_balance).to eq('14.16')
    end
  end

  describe '#withdraw' do
    it 'minuses an amount to a customers bank balance' do
      account.withdraw('1.05')
      expect(account.current_balance).to eq('-1.05')
    end
    it 'can make multiple withdrawals' do
      account.withdraw('2.01')
      account.withdraw('12.15')
      expect(account.current_balance).to eq('-14.16')
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
