class BuyForm
  include ActiveModel::Model
  attr_accessor :telephone, :postcode, :prefecture_id, :city, :block, :building, :buy, :user, :item
  with_options presence: true do
    validates :telephone
    validates :postcode
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :buy
    validates :user
    validates :item
  end

  def save
    Buy.create(telephone: telephone, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, buy: buy)
    Buys_address.create(user: user, item: item)
  end
end