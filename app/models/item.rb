class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title
    validates :price, numericality: { only_integer: true }, format: { with: /\A[300-9999999\d]+\z/}
    validates :catch_copy
    validates :category_id, numericality: { other_than: 1 } 
    validates :state_id, numericality: { other_than: 1 } 
    validates :postage_id, numericality: { other_than: 1 } 
    validates :address_id, numericality: { other_than: 1 } 
    validates :delivery_id, numericality: { other_than: 1 } 
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
