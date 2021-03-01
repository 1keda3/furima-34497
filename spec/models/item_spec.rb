require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'imageとtitle,price,user_id,catch_copy,category_id,state_id,postage_id,address_id,delivery_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'catch_copyが空では出品できない' do
        @item.catch_copy = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Catch copy can't be blank"
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'state_idが空では出品できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it 'postage_idが空では出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it 'address_idが空では出品できない' do
        @item.address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Address can't be blank"
      end
      it 'delivery_idが空では出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end