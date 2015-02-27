FactoryGirl.define do
  factory :label do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    service_id { rand(10000000) }
  end
end