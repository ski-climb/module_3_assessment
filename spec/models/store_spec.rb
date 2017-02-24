require 'rails_helper'

describe Store do
  context "attributes" do
    let!(:store) { Store.new(raw_store_response) }
    subject { store }

    it { is_expected.to respond_to(:long_name) }
    it { is_expected.to respond_to(:city) }
    it { is_expected.to respond_to(:distance) }
    it { is_expected.to respond_to(:phone) }
    it { is_expected.to respond_to(:store_type) }

    it "sets the attributes upon initialization" do
      expect(store.long_name).to eq "Really long store name"
      expect(store.city).to eq "DENVER"
      expect(store.distance).to eq 3.45
      expect(store.phone).to eq "303-270-9189"
      expect(store.store_type).to eq "Mobile SAS"
    end
  end
end
