require 'rails_helper'

RSpec.describe StockSymbol, type: :model do
  # Association test
  # ensure StockSymbol model has a 1:m relationship with the Stock Alert model
  it { should have_many(:stock_alerts) }

  # ensure StockSymbol model has a belongs_to relationship with the Wallet model
  it { should belong_to(:wallet) }

  # Validation tests
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:high) }
  it { should validate_presence_of(:low) }
end
