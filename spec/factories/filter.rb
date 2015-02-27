FactoryGirl.define do
  factory :filter do
    active { false }
    name { Faker::Lorem.word }
    position { rand(1..100) }
    service_id { rand(10000000)}
  end
end