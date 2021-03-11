class BuyForm
  include ActiveModel::Model
  attr_accessor :telephone, :postcode, :prefecture_id, :city, :block, :building, :buy, :user, :item, :token, :price, :user_id

  with_options presence: true do
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :token
  end

  def save
    buy = Buy.create(user_id: user, item_id: item)
    BuysAddress.create(telephone: telephone, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block,
                       building: building, buy_id: buy.id)
  end
end
