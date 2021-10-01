FactoryBot.define do
  factory :map do
    name {Faker::Name.name}
    address {"神奈川県横浜市青葉区美しが丘1−1"}
    message {Faker::Lorem.sentence}
    association :user 
    after(:build) do |map|
      map.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
