class SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&pageSize=16&show=longName,city,distance,phone,storeType&apiKey=#{ENV['BEST_BUY_KEY']}")
    raw_stores_data = JSON.parse(response.body, symbolize_names: true)
    raw_stores = raw_stores_data[:stores]
    @stores_count = raw_stores.count
    @stores = raw_stores[0..9].map do |raw_store|
      Store.new(raw_store)
    end
  end
end

