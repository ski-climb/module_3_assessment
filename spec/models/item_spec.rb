require 'rails_helper'

describe Item do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
