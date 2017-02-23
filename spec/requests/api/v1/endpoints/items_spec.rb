require 'rails_helper'

describe "Items API" do
  let!(:item_1)  { Item.create(name: "item 1", description: "lovely", image_url: "https://s3.amazonaws.com/happy-trails/public/uploads/obstacle-2017-02-20t19-08-44-07-00") }
  let!(:item_2)  { Item.create(name: "item 2", description: "ugly", image_url: "https://s3.amazonaws.com/happy-trails/public/uploads/landslide-2017-02-20t19-09-07-07-00") }

  context "viewing all items" do
    it "returns a list of items" do

      get 'api/v1/items'
      items = JSON.parse(response.body)
      item = items.first

      expect(response).to be_success
      expect(items.length).to eq 2
      expect(item["name"]). to eq "item 1"
      expect(item["description"]). to eq "lovely"
      expect(item["image_url"]). to eq "https://s3.amazonaws.com/happy-trails/public/uploads/obstacle-2017-02-20t19-08-44-07-00"
      expect(item["created_at"]).to be_nil
      expect(item["update_at"]).to be_nil
    end
  end

  context "finding one item by id" do
    it "returns one item" do
      get "api/v1/items/#{item_1.id}"
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["name"]). to eq "item 1"
      expect(item["description"]). to eq "lovely"
      expect(item["image_url"]). to eq "https://s3.amazonaws.com/happy-trails/public/uploads/obstacle-2017-02-20t19-08-44-07-00"
      expect(item["created_at"]).to be_nil
      expect(item["update_at"]).to be_nil
    end
  end
end
