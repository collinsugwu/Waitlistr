# frozen_string_literal: true

class StocksController < ApplicationController
  def index
    @stock_symbols = Wallet.first.stock_symbols
  end

  def load_stock
    # get the params into comma separated strings
    symbol = params[:name].reject(&:blank?).join(',')

    # load the stock from the service class
    stocks = MarketStackManager::LoadStock.call(symbol)

    # create alert service
    MarketStackManager::CreateAlert.call(stocks, params)
    redirect_to alerts_path
  end

  def alerts
    @alerts = StockAlert.includes(:stock_symbol).paginate(page: params[:page], per_page: 10)
  end

  private

  def stock_params
    params.permit(:name)
  end
end
