require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it 'すべての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank") 
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  
        @user.valid?  
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ａｂｃ１２３'  
        @user.password_confirmation = 'ａｂｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = 'password123'
        @user.password_confirmation = 'password456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '姓（全角）が空だと登録できない' do
        @user.last_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'Yamada'  
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it '名（全角）が空だと登録できない' do
        @user.first_name = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'Taro'  
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it '姓（カナ）が空だと登録できない' do
        @user.katakana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        invalid_values = ['やまだ', '山田', 'yamada', '山田123', '山田!@#']
        invalid_values.each do |invalid_value|
          @user.katakana_last_name = invalid_value
          @user.valid?
          expect(@user.errors.full_messages).to include('Katakana last name は全角カタカナで入力してください')
        end
      end
      it '名（カナ）が空だと登録できない' do
        @user.katakana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        invalid_values = ['たろう', '太郎', 'taro', 'タロウ123', 'タロウ!@#']
        invalid_values.each do |invalid_value|
          @user.katakana_first_name = invalid_value
          @user.valid?
          expect(@user.errors.full_messages).to include('Katakana first name は全角カタカナで入力してください')
        end
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
