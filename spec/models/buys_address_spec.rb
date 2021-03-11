require 'rails_helper'

RSpec.describe BuysAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_form = FactoryBot.build(:buy_form, user: @user.id, item: @item.id)
    sleep 0.1 # 0.1秒待機
  end

  describe '購入機能' do
    context '購入できるとき' do
      it 'telephoneとpostcodeとprefecture_idとcityとblockとtokenとuserとitemがあれば購入できる' do
        expect(@buy_form).to be_valid
      end
      it '建物番号は空でも登録できる' do
        @buy_form.building = ''
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
      it 'telephoneは数字以外の値は登録できない' do
        @buy_form.telephone = 'あいうえお'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Telephone is invalid'
      end
      it 'postcodeはハイフンがないと登録できない' do
        @buy_form.postcode = '1234567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Postcode is invalid. Include hyphen(-)'
      end
      it 'prefecture_idは1だと登録できない' do
        @buy_form.prefecture_id = 1
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'user_idがないと登録できない' do
        @user.id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'item_idがないと登録できない' do
        @item.id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it 'telephoneは英数混合では登録できない' do
        @buy_form.telephone = 'abc1234abcd'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Telephone is invalid'
      end
      it 'telephoneは12桁以上では登録できない' do
        @buy_form.telephone = '123456789012'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Telephone is invalid'
      end
    end
  end
end
