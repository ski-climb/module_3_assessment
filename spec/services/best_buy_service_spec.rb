require 'rails_helper'

describe BestBuyService do
  describe ".stores_by_zipcode" do
    let(:zipcode) { "85745" }
    it "returns up to ten stores which are closest the center of the zipcode", vcr: true do
      raw_stores = BestBuyService.stores_by_zipcode(zipcode)
      raw_store = raw_stores.first

      expect(raw_stores).to be_an Array
      expect(raw_store).to have_key :longName
      expect(raw_store).to have_key :city
      expect(raw_store).to have_key :distance
      expect(raw_store).to have_key :phone
      expect(raw_store).to have_key :storeType

      expect(raw_store[:longName]).to be_a String
      expect(raw_store[:distance]).to be_a Float
    end
  end
end
