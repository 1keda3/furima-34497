FactoryBot.define do
  factory :buy_form do
    telephone     { '12312341234' }
    postcode      { '123-4567' }
    prefecture_id { 15 }
    city          { '横浜' }
    block         { '青山1-1-1' }
    building      { 'ビル' }
    token         { 'tok_abcdefghijk00000000000000000' }
    item          { 1 }
    user          { 1 }
  end
end
