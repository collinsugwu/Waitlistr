# frozen_string_literal: true

class StockSymbolsController < ApplicationController
  before_action :set_stock_symbol, only: %i[edit update destroy]

  # GET /stock-symbols
  def index
    @symbols = StockSymbol.paginate(page: params[:page], per_page: 10)
  end

  # GET /stock-symbols/
  def new
    @stock_symbol = StockSymbol.new
  end

  # GET /stock-symbols/:id
  def edit; end

  # POST /stock-symbols
  def create
    @stock_symbols = Wallet.first.stock_symbols.create!(stock_symbols_params)
    if @stock_symbols
      redirect_to stock_symbols_url, notice: 'Stock Symbols was Successfully Created.'
    else
      render :new
    end
  end

  # PUT /stock-symbols/:id
  def update
    if @stock_symbol.update!(stock_symbols_params)
      redirect_to stock_symbols_url, notice: 'Stock Symbols was Successfully Updated.'
    else
      render :edit
    end
  end

  private

  def stock_symbols_params
    params.require(:stock_symbol).permit(:name, :high, :low)
  end

  def set_stock_symbol
    @stock_symbol = StockSymbol.friendly.find(params[:id])
  end
end
