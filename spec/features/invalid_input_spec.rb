# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }

  it 'does not allow alphabetical input' do
    allow(account).to receive(:todays_date).and_return('10/01/2012')
    expect { account.deposit('string') }.to raise_error(StandardError, 'Invalid Input.')
  end

  it 'does not allow negative input' do
    allow(account).to receive(:todays_date).and_return('10/01/2012')
    expect { account.withdraw('-1000.00') }.to raise_error(StandardError, 'Invalid Input.')
  end
end
