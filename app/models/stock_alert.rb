# frozen_string_literal: true

class StockAlert < ApplicationRecord
  belongs_to :stock_symbol
end
