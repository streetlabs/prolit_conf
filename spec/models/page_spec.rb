require 'spec_helper'

describe Page do
  describe "Creation of Pages" do
    subject { FactoryGirl.create(:page) }
    it { should validate_presence_of(:identifier)   }
    it { should validate_uniqueness_of(:identifier) }
  end
end
