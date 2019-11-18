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
  end
end
