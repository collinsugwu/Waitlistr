require 'rails_helper'

RSpec.describe Wallet, type: :model do
  # Association test
  # ensure Wallet model has a 1:m relationship with the StockSymbol model
  it { should have_many(:stock_symbols).dependent(:destroy) }
end
