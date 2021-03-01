FactoryBot.define do
  factory :item do
    title       { Faker::JapaneseMedia::Naruto.character }
    price       { Faker::Number.within(range: 300..9_999_999) }
    catch_copy  { Faker::JapaneseMedia::Naruto.village }
    category_id { Faker::Number.within(range: 2..10) }
    state_id    { Faker::Number.within(range: 2..6) }
    postage_id  { Faker::Number.within(range: 2..2) }
    address_id  { Faker::Number.within(range: 2..47) }
    delivery_id { Faker::Number.within(range: 2..3) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png', content_type: 'image/png')
    end
  end
end
