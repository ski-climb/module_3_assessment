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
  end
end
