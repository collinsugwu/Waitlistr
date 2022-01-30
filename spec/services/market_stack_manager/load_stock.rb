require 'rails_helper'

RSpec.describe MarketStackManager::LoadStock, type: :model do
  describe '#call' do

    # Idealy we would stub the request for external api
    # but, since what we're testing isn't that much,
    # I believe we can spare 2sec for the response.

    it 'makes a successful request to API' do
      res =  MarketStackManager::LoadStock.new('AAPL').call
      expect(res).to be_kind_of(Array)
      expect(res.first).to be_kind_of(Hash)
      expect(res.first['symbol']).to eq('AAPL')
    end

    it 'return an exception from wrong symbol used' do
        expect { MarketStackManager::LoadStock.new('oar').call }.to(raise_error(MarketStack::Exception))
    end

    it 'return an exception when no symbol is passed' do
        expect { MarketStackManager::LoadStock.new('').call }.to(raise_error(MarketStack::Exception))
    end
  end
end