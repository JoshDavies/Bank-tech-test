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
      account.deposit(2.01)
      expect(customer.current_balance).to eq('2.01')
    end
  end
end
