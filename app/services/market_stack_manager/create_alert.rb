# frozen_string_literal: true

module MarketStackManager
  class CreateAlert < ApplicationService
    attr_reader :stock_response

    def initialize(stock_response, params)
      @stock_response = stock_response
      @params = params
    end

    def call
      clean_params = @params[:name].reject(&:blank?)
      symbols = StockSymbol.where('name IN (?)', clean_params)
      match_thresholds(symbols)
    end

    private

    def match_thresholds(symbols)
      data = []
      symbols.each do |symbol|
        @stock_response.each do |response|
          next unless symbol.name == response['symbol'] && threshold(symbol, response)

          # create a hash for each alert
          alert = {
            stock_symbol_id: symbol.id,
            high: response['high'],
            low: response['low'],
            close: response['close'],
            date: response['date']
          }
          # delete previous alerts
          delete_alert(symbol)
          data << alert
        end
      end
      create_alert(data)
    end

    def create_alert(data)
      StockAlert.insert_all(data)
    end

    def delete_alert(symbol)
      StockAlert.where(stock_symbol_id: symbol.id).destroy_all
    end

    def threshold(symbol, response)
      response['open'] < symbol.high || response['open'] > symbol.low
    end
  end
end
