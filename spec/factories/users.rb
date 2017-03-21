# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "belle#{n}@france.com"
    end
    first_name "Belle"
    last_name "InFrance"
    description "I love to read"
    password 'roserose'
    password_confirmation 'roserose' 
  end
end
