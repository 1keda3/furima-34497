class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    validates :catch_copy

    with_options numericality: { other_than: 1 } do
     validates :category_id
     validates :state_id
     validates :postage_id
     validates :address_id
     validates :delivery_id
    end
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :address
  belongs_to :category
  belongs_to :postage
  belongs_to :state
  belongs_to :delivery
end
