# frozen_string_literal: true

class Wallet < ApplicationRecord
  has_many :stock_symbols, dependent: :destroy, foreign_key: :wallet_id
end
