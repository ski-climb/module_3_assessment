class Store
  attr_reader :long_name,
              :city,
              :distance,
              :phone,
              :store_type 

  def initialize(data = {})
    @long_name  = data[:longName]
    @city       = data[:city]
    @distance   = data[:distance]
    @phone      = data[:phone]
    @store_type = data[:storeType]
  end

  def self.stores_by_zipcode(zipcode)
    raw_stores = BestBuyService.stores_by_zipcode(zipcode)
    raw_stores.map do |raw_store|
      Store.new(raw_store)
    end[0..9]
  end
end
