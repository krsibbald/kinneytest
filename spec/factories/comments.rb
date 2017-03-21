# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    post
    body "Put our service to the test"
    user
  end
end
