# frozen_string_literal: true

class StockSymbol < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :wallet
  has_many :stock_alerts

  # validations
  validates :name, uniqueness: true, presence: true
  validates :high, presence: true
  validates :low, presence: true
  validate :validate_threshold?

  before_save :upcase_field

  def upcase_field
    name.upcase!
  end

  def validate_threshold?
    return if [low.blank?, high.blank?].any?

    errors.add(:validate_threshold, 'High must be greater than Low') if low >= high
  end
end
