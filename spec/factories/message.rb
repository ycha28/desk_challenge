FactoryGirl.define do
  factory :message do
    body { Faker::Lorem.paragraph }
    remote_created_at { Time.now }
  end
end