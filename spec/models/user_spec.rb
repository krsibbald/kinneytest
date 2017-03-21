require 'rails_helper'

RSpec.describe User, type: :model do
  it "user emails must be unique" do
    first_user = FactoryGirl.create(:user, email: 'beast@castle.com')
    expect(first_user.valid?).to eq true
    second_user = FactoryGirl.build(:user, email: 'beast@castle.com')
    expect(second_user.valid?).to eq false
  end
end
