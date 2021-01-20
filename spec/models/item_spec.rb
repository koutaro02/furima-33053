require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全て正しく入力できていたら登録できること' do
      expect(@item).to be_valid
    end

    it '商品名が空では登録できない' do
      @item.product = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product can't be blank")
    end

    it '商品の説明が空では登録できない' do
      @item.product_explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product explain can't be blank")
    end

    it 'カテゴリーの情報が空では登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it '商品の状態の情報が空では登録できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end

    it '配送者の情報が空では登録できない' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden is not a number')
    end

    it '発送元の地域の情報が空では登録できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end

    it '発送までの日数の情報が空では登録できない' do
      @item.delivery_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery time is not a number')
    end

    it '価格の情報が空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が¥300以上でなければ登録できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格の範囲が¥9,999,999以上でなければ登録できない' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
