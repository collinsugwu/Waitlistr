# frozen_string_literal: true

require 'net/http'
require 'market_stack/exception'
module MarketStack
  class Client
    def make_request(_endpoint, args)
      uri = base_url
      uri.query = URI.encode_www_form(args)
      json = Net::HTTP.get(uri)
      response = JSON.parse(json)

      return response['data'] if response['data'].present?

      msg = "#{response['error']['code']}, #{response['error']['message']}"
      raise MarketStack::Exception, msg
    end

    private

    def base_url
      URI('http://api.marketstack.com/v1/eod')
    end
  end
end
