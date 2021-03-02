FactoryBot.define do
  factory :item do
    title       { "サンプル商品" }
    price       { 1000 }
    catch_copy  { "サンプル商品の説明" }
    category_id { 2 }
    state_id    { 3 }
    postage_id  { 2 }
    address_id  { 15 }
    delivery_id { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png', content_type: 'image/png')
    end
  end
end
