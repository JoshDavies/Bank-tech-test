# frozen_string_literal: true

require 'account'

describe Account do
  describe '#current_balance' do
    it 'keeps track of a customers bank balance' do
      customer = Account.new
      expect(customer.current_balance).to_eq(0)
    end
  end
end
