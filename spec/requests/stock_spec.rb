require 'rails_helper'

RSpec.describe "Stocks", type: :request do
    let!(:wallet) {FactoryBot.create(:wallet)}
    let!(:symbols) { FactoryBot.create(:stock_symbol, wallet_id: wallet.id, name: 'MSFT') }

  describe "GET /index" do
      it "return stock_symbols index page" do
        get "/stock"

        expect(response).to render_template(:index)
        expect(response.body).to include("Check Stock")
        expect(response.body).to include(symbols.name)
      end      
  end

  describe "get /alert" do
    let!(:alert) {FactoryBot.create(:stock_alert, stock_symbol_id: symbols.id)}

    it "lists all alert" do
      get '/alerts'
      
      expect(response).to render_template(:alerts)
      expect(response.body).to include("Alerts")
      expect(response.body).to include(symbols.name)
    end   
  end
end
