# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "Beauty and the Beast"
    body "Be Our Guest"
    user
  end
end
