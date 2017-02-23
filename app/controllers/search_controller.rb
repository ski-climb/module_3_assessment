class SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['BEST_BUY_KEY']}")
    puts response.body
    raw_stores_data = JSON.parse(response.body, symbolize_names: true)
    puts raw_stores_data
    @raw_stores = raw_stores_data[:stores]
    puts "***************"
    puts @raw_stores
    puts "***************"
    puts @raw_stores.class
    puts @raw_stores.length
    @stores = @raw_stores.map do |raw_store|
      Store.new(raw_store)
    end
    binding.pry
  end
end

class Store
  attr_reader :long_name,
              :city,
              :distance,
              :phone,
              :store_type 

  def initialize(data = {})
    data[:longName]  = @long_name
    data[:city]      = @city
    data[:distance]  = @distance
    data[:phone]     = @phone
    data[:storeType] = @store_type
  end
end
