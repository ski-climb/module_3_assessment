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
