require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

   context '新規登録できる時' do

    it "全ての項目の入力が存在すれば登録できること" do
      expect(@user).to be_valid
    end

   end

   context '新規登録できない時' do

    it "ニックネームが空では登録できない" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "メールアドレスが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスに＠を含む必要があること" do
      @user.email = "1111com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必要であること" do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角数字のみは登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "パスワードは全角英数字混合では登録できない" do
      @user.password = "ＡＡ１１１１"
      @user.password_confirmation = "ＡＡ１１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "パスワードは半角英字のみでは登録できない" do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードと確認用パスワードの値が一致すること" do
      @user.password = "123aaaa"
      @user.password_confirmation = "123iiii"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameは全角の漢字・ひらがな・カタカナでの入力が必須であること" do
      @user.first_name = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です")
    end

    it "last_nameは全角の漢字・ひらがな・カタカナでの入力が必須であること" do
      @user.last_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です")
    end

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_name_kanaは全角のカタカナでの入力が必須であること" do
      @user.first_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana ユーザー本名のフリガナは、全角（カタカナ）での入力が必須です")
    end

    it "last_name_kanaは全角のカタカナでの入力が必須であること" do
      @user.last_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana ユーザー本名のフリガナは、全角（カタカナ）での入力が必須です")
    end

    it "生年月日が必須である" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end
end
