require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context '商品投稿がうまくいくとき' do
      it 'imageとname,explanatory_textとgenre_id、status_idとdelivery_fee_id、address_idとdelivery_date_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿がうまくいかないとき' do
      it 'imageが空だと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと投稿できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanatory_textが空だと投稿できない' do
        @item.explanatory_text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanatory text can't be blank")
      end

      it 'genre_idが空(id:0)だと投稿できない' do
        @item.genre_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre Select')
      end

      it 'status_idが空(id:0)だと投稿できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end

      it 'delivery_fee_idが空(id:0)だと投稿できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end

      it 'address_idが空(id:0)だと投稿できない' do
        @item.address_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Address Select')
      end

      it 'delivery_date_idが空(id:0)だと投稿できない' do
        @item.delivery_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date Select')
      end

      it 'priceが空だと投稿できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格の範囲が10,000,000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格の入力が全角数字だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it '価格の入力が漢字だと登録できない' do
        @item.price = '千円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it '価格の入力が平仮名だと登録できない' do
        @item.price = 'せんえん'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it '価格の入力がカタカナだと登録できない' do
        @item.price = 'センエン'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it '価格の入力が半角英語だと登録できない' do
        @item.price = 'senen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it '価格の入力が全角英語だと登録できない' do
        @item.price = 'ＳＥＮＥＮ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
    end
  end
end
