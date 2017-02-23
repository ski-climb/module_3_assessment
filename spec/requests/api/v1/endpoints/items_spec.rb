require 'rails_helper'

describe "Items API" do
  it "returns a list of items" do
    item_1 = Item.create(name: "item 1", description: "lovely", image_url: "https://s3.amazonaws.com/happy-trails/public/uploads/obstacle-2017-02-20t19-08-44-07-00")
    item_2 = Item.create(name: "item 2", description: "ugly", image_url: "https://s3.amazonaws.com/happy-trails/public/uploads/landslide-2017-02-20t19-09-07-07-00")

    get 'api/v1/items'

  end
end
