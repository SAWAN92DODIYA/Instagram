require 'rails_helper'

RSpec.describe User, :type => :model do
   subject {
    described_class.new(
                        email: "sawandodiya02gmail.com"
                        name: "Sawan Dodiya",
                        profile_name: "sawan@02",
                        gender: "male",
                        birth_date: DateTime.now,
                        picture: 1)
  }

  it "is valid with valid attributes" do
    # expect(Auction.new).to be_valid
  end

  it "is not valid without a title"
  it "is not valid without a description"
  it "is not valid without a start_date"
  it "is not valid without a end_date"
end