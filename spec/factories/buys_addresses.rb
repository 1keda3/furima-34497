FactoryBot.define do
  factory :buy_form do
    telephone     { 12345678901 }
    postcode      { 123-4567 }
    prefecture_id { 15 }
    city          { '横浜' }
    block         { '青山1-1-1' }
    building      { 'ビル' }
    association   :buy
  end
end
