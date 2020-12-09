require 'rails_helper'
RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'クレジットカード情報、postal_code, address_id, city, house_number, tell_numberがあれば登録できる' do
        expect(@user_purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'クレジットカードの情報が空だと購入できない' do
      end

      it '郵便番号が空だと購入できない' do
        @user_purchase.postal_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが入っていないと購入できない' do
        @user_purchase.postal_code = 1234567
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が空だと購入できない' do
        @user_purchase.address_id = 0
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address Select")
      end

      it '市区町村が空だと購入できない' do
        @user_purchase.city= nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入できない' do
        @user_purchase.house_number= nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @user_purchase.tell_number= nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Tell number can't be blank")
      end

      it '電話番号が12桁以上だと購入できない' do
        @user_purchase.tell_number= "090123456789"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Tell number input Only Numbers.Number of digits 11")
      end

      it '電話番号にハイフンが入っていると購入できない' do
        @user_purchase.tell_number= "090-1234-5678"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Tell number input Only Numbers.Number of digits 11")
      end
    end
  end
end
