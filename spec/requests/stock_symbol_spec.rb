require 'rails_helper'

RSpec.describe "StockSymbols", type: :request do
  describe "GET /index" do
    let!(:wallet) {FactoryBot.create(:wallet)}
    let!(:symbols) { FactoryBot.create(:stock_symbol, wallet_id: wallet.id, name: 'MSFT') }

      it "return stock_symbols index page" do
        get "/stock_symbols"

        expect(response).to render_template(:index)
        expect(response.body).to include("New Symbol")
        expect(response.body).to include(symbols.name)
      end      
  end

  describe "GET /new" do
      it "return stock_symbols new page" do

        get new_stock_symbol_path
        
        expect(response).to render_template(:new)
        expect(response.body).to include("New Symbol")
      end 
  end

  describe "POST /new" do
    let!(:wallet) {FactoryBot.create(:wallet)}

    it "create a stock_symbols" do
      post stock_symbols_path, params: {stock_symbol: {name: 'AAPL', high: 120, low: 110}}
      
      expect(response).to redirect_to(stock_symbols_url)
    end   
    
    it "has the correct values" do
      post stock_symbols_path, params: {stock_symbol: {name: 'AAPL', high: 120, low: 110}}
      
       symbol = StockSymbol.find_by(name: 'AAPL')
       expect(response).to redirect_to(stock_symbols_url)
       follow_redirect!
       expect(response).to render_template(:index)
       expect(response.body).to include(symbol.name)
    end  
  end
end
