require 'rails_helper'

RSpec.describe User, type: :model do
  it "user emails must be unique" do
    first_user = FactoryGirl.create(:user, email: 'beast@castle.com')
    expect(first_user.valid?).to eq true
    second_user = FactoryGirl.build(:user, email: 'beast@castle.com')
    expect(second_user.valid?).to eq false
    expect(second_user.errors.messages[:email]).to include "has already been taken"
  end
  it "email must be in good format" do
    user = FactoryGirl.build(:user, email: 'gaston')
    expect(user.valid?).to eq false
    expect(user.errors.messages).to eq ({email: ["is invalid"]})
  end

  it "name" do
    user = FactoryGirl.create(:user, first_name: 'Maurice', last_name: 'TheInventor')
    expect(user.name).to eq "Maurice TheInventor"
  end

  it "user must have email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user.valid?).to eq false
    expect(user.errors.messages).to eq ({email: ["can't be blank"]})
  end

  it "user must have first_name" do
    user = FactoryGirl.build(:user, first_name: nil)
    expect(user.valid?).to eq false
    expect(user.errors.messages).to eq ({first_name: ["can't be blank"]})
  end

  it "user must have last_name" do
    user = FactoryGirl.build(:user, last_name: nil)
    expect(user.valid?).to eq false
    expect(user.errors.messages).to eq ({last_name: ["can't be blank"]})
  end
end
