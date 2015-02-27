FactoryGirl.define do
  factory :case do
    subject { Faker::Lorem.sentence }
    priority { rand(1..9) }
    blurb { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    status { ['open', 'pending', 'resolved'].sample }
    service_id { rand(10000000) }
    remote_updated_at { Time.now }
    message { factory :message }
  end
end
