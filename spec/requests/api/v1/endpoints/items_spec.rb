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

  context "deleting one item by id" do
    let!(:item_3)  { Item.create(name: "item 3", description: "logs", image_url: "https://s3.amazonaws.com/happy-trails/public/uploads/obstacle-2017-02-20t19-08-44-07-00") }

    context "the item exits" do
      it "deletes the item" do
        delete "api/v1/items/#{item_3.id}"

        expect(response.status).to eq 204
      end
    end

    context "the item cannot be found" do
      it "returns a 404 status" do
        delete "api/v1/items/12341234"

        expect(response.status).to eq 404
      end
    end
  end

  context "creating an item" do
    let!(:name) { "cats" }
    let!(:description) { "what it sounds like" }
    let!(:image_url) { "https://s3.amazonaws.com/happy-trails/public/uploads/landslide-2017-02-20t19-09-07-07-00" }

    context "the item is not created" do
      it "returns 422 response code" do
        post "api/v1/items", item: { not_valid: "bad params" }

        expect(response.status).to eq 422
      end
    end

    context "the item is created successfully" do
      it "returns a 201 status and the item" do
        post "api/v1/items", item: { name: name, description: description, image_url: image_url }

        item = JSON.parse(response.body)

        expect(response.status).to eq 201
        expect(item["name"]). to eq name
        expect(item["description"]). to eq description
        expect(item["image_url"]). to eq image_url
        expect(item["created_at"]).to be_nil
        expect(item["update_at"]).to be_nil
      end
    end

  end
end
