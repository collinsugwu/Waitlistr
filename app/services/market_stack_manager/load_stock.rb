# frozen_string_literal: true

require 'market_stack/client'

module MarketStackManager
  class LoadStock < ApplicationService
    def initialize(symbols)
      @api_key = ENV['MARKET_STACK_KEY']
      @client = MarketStack::Client.new
      @symbols = symbols
    end

    def call
      args = {
        access_key: @api_key,
        symbols: @symbols
      }
      @client.make_request('eod', args)
    end
  end
end
