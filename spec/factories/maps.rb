FactoryBot.define do
  factory :map do
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user 
  end
end
