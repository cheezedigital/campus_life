# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    text { Faker::BaconIpsum.paragraph }
    complete { false }
  end
end
