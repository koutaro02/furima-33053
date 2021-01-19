require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '住所情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, item_id: @item.id)
      sleep 0.5
    end

    it '住所が正しく入力されていれば登録できること' do
      expect(@buyer_address).to be_valid
    end

    it 'user_idがなければ登録できない' do
      @buyer_address.user_id = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idがなければ登録できない' do
      @buyer_address.item_id = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'postcodeが空では登録できないこと' do
      @buyer_address.postcode = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postcode can't be blank")
    end

    it 'postcodeはハイフンがなければ登録できないこと' do
      @buyer_address.postcode = '1234567'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-).')
    end

    it 'prefectureを選択しないと登録できないこと' do
      @buyer_address.prefecture_id = 0
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では登録できないこと' do
      @buyer_address.city = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("City can't be blank")
    end

    it 'cityは半角英数字だと登録できない' do
      @buyer_address.city = 'nagoya1-1'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('City is invalid. Input full-width characters.')
    end

    it 'blockが空では登録できないこと' do
      @buyer_address.block = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Block can't be blank")
    end

    it 'blockは半角英字では登録できないこと' do
      @buyer_address.block = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Block is invalid. Input full-width characters.')
    end

    it 'buildingは空でも登録できること' do
      @buyer_address.building = nil
      expect(@buyer_address).to be_valid
    end

    it 'phone_numberが空では登録できないこと' do
      @buyer_address.phone_number = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberは全角文字数字では登録できないこと' do
      @buyer_address.phone_number = '０９０１２３４５６７８'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number is invalid. Input full-width characters.')
    end

    it 'phone_numberは11桁以内でないと登録できない' do
      @buyer_address.phone_number = '090012345678'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number is invalid. Input full-width characters.')
    end

    it 'tokenが空では登録できないこと' do
      @buyer_address.token = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
