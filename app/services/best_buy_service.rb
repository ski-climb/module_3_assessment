class BestBuyService

  def self.stores_by_zipcode(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&pageSize=16&show=longName,city,distance,phone,storeType&apiKey=#{ENV['BEST_BUY_KEY']}")
    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
