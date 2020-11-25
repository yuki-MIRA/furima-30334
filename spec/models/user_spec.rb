require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_readingとfirst_name_reading、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'family_nameが空だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_readingが空だと登録できない' do
        @user.family_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end

      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a1111'
        @user.password_confirmation = 'a1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'a11111'
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'passwordが存在してもpassword_confirmationが同じでなければ登録できない' do
        @user.password = 'a11111'
        @user.password_confirmation = 'a22222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'family_nameが英語では登録できない' do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end

      it 'family_nameが数字では登録できない' do
        @user.family_name = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end

      it 'first_nameが英語では登録できない' do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it 'first_nameが数字では登録できない' do
        @user.first_name = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it 'family_name_readingは平仮名だと登録できない' do
        @user.family_name_reading = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name reading is invalid. Input full-width katakana characters.')
      end

      it 'family_name_readingは漢字だと登録できない' do
        @user.family_name_reading = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name reading is invalid. Input full-width katakana characters.')
      end

      it 'first_name_readingは平仮名だと登録できない' do
        @user.first_name_reading = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid. Input full-width katakana characters.')
      end

      it 'first_name_readingは漢字だと登録できない' do
        @user.first_name_reading = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid. Input full-width katakana characters.')
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'パスワードは数字のみの入力だと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは英字のみの入力だと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it "パスワードが全角入力だと登録できない" do
        @user.password = "a１２３４５"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
