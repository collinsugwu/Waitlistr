require 'rails_helper'

RSpec.describe StockAlert, type: :model do
  # Association test

  # ensure StockSymbol model has a belongs_to relationship with the Wallet model
  it { should belong_to(:stock_symbol) }
end
