require 'rails_helper'

RSpec.describe BuysAddress, type: :model do
  before do
    @buy_form = FactoryBot.build(:buy_form)
  end

  describe '購入機能' do
    context '購入できるとき' do
      it 'telephoneとpostcodeとprefecture_idとcityとblockとtokenがあれば購入できる' do
        expect(@buy_form).to be_valid
      end
    end
    context '購入できないとき' do
      it 'telephoneがない' do
        @buy_form.telephone = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Telephone can't be blank"
      end
      it 'postcodeがない' do
        @buy_form.postcode = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Postcode can't be blank"
      end
      it 'prefecture_idがない' do
        @buy_form.prefecture_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Prefecture can't be blank", 'Prefecture is not a number'
      end
      it 'cityがない' do
        @buy_form.city = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "City can't be blank"
      end
      it 'blockがない' do
        @buy_form.block = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Block can't be blank"
      end
      it 'tokenがない' do
        @buy_form.token = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
