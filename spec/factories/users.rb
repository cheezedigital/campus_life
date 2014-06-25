# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { rand(30).years.ago }
    email { Faker::Internet.email }
    github_username { Faker::Internet.user_name }
    hobbies { Faker::BaconIpsum.words.join(', ') }
    active { true }
  end
end
