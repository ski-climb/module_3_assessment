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
end
