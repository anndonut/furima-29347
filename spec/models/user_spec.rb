require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  # describe User do
  describe 'ユーザー新規登録' do
    # describe '#create' do
      # 1. nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できること
      # it "is valid with a nickname, email, password, password_confirmation" do
        # user = build(:user)
      it ' nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できる' do
        expect(@user).to be_valid
      end
  
      # 2. nicknameが空では登録できないこと
      # it "is invalid without a nickname" do
      #   user = build(:user, nickname: nil)
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        # expect(@user.errorrs.full_messages).to include("Nickname can't be blank")
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      # # 3. emailが空では登録できないこと
      # it "is invalid without a email" do
      #   user = build(:user, email: nil)
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      # 4. first_nameが空では登録できないこと
      # it "is invalid without a first_name" do
      #   user = build(:user, first_name: nil)
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name can't be blank", "First name 全角文字を使用してください")
      end
  
      # 5. family_nameが空では登録できないこと
      # it "is invalid without a last_name" do
      #   user = build(:user, last_name: nil)
      it 'family_nameが空では登録できない'do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name can't be blank", "Family name 全角文字を使用してください")
      end
  
  
      # 6. birth_yearが空では登録できないこと
      # it "is invalid without a birth_day" do
      #   user = build(:user, birth_day: nil)
      it 'birth_yearが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank", "Birth day can't be blank", "Birth day 生年月日を入力してください")
      end
  
      # 7. family_name_kanaが空では登録できないこと
      # it "is invalid without a last_name_kana" do
      #   user = build(:user, last_name_kana: nil)
      it 'family_name_kanaが空では登録できない'do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana can't be blank", "Family name kana 全角文字(カナ)を使用してください")
      end

      # パスワードが英字のみだとユーザー登録できない
      it 'パスワードが英字のみだとユーザー登録できない'do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end


      # パスワードが数字のみだとユーザー登録できない
      it 'パスワードが数字のみだとユーザー登録できない'do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
  
      # 10. first_name_kanaが空では登録できないこと
      # it "is invalid without a first_name_kana" do
      #   user = build(:user, first_name_kana: nil)
      it 'first_name_kanaが空では登録できない'do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana can't be blank", "First name kana 全角文字(カナ)を使用してください")
      end
  
      # 11. passwordが空では登録できないこと
      # it "is invalid without a password" do
      #   user = build(:user, password: nil)
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        # expect(user.errors.full_messages).to include("を入力してください", "は7文字以上で入力してください", "は半角英数字７文字以上で入力してください")
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      # 12. passwordが存在してもpassword_confirmationが空では登録できないこと
      # it "is invalid without a password_confirmation although with a password" do
      #   user = build(:user, password_confirmation: "")
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        # expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      # 13. 重複したemailが存在する場合登録できないこと
      # it "is invalid with a duplicate email address" do
      #   user = create(:user)
        # another_user = build(:user, email: user.email)
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
  
      # 14. passwordが7文字以上であれば登録できること
      # it "is valid with a password that has more than 7 characters " do
      #   user = build(:user, password: "0000000", password_confirmation: "0000000")
      it 'passwordが7文字以上であれば登録できる'do
        @user.password = "123456a"
        @user.password_confirmation = "123456a"
        expect(@user).to be_valid
      end
  
      # 15. passwordが6文字以下であれば登録できないこと
      # it "is invalid with a password that has less than 6 characters " do
      #   user = build(:user, password: "000000", password_confirmation: "000000")
      it 'passwordが6文字以下であれば登録できない'do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password には英字と数字の両方を含めて設定してください")
      end

      #メールアドレスに@が含まれていないとユーザー登録できない
      it 'メールアドレスに@が含まれていないとユーザー登録できない'do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      #first_nameは全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない
      it 'first_nameは全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない'do
      @user.first_name = "aaa333"
      @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end

      #family_nameは全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない
      it 'family_nameは全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない'do
        @user.family_name = "aaa333"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
    end
  
    # 16. family_name_kanaがカタカナでないと登録できないこと
    describe '#katakana' do
      # it 'family_name_kanaがカタカナで返ること' do
      #   user = build(:user, last_name_kana: "kana")
      it 'family_name_kanaがカタカナでないと登録できない'do
        @user.family_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角文字(カナ)を使用してください")
      end
    
  
      # 17. first_name_kanaがカタカナでないと登録できないこと    
      # it 'first_name_kanaがカタカナで返ること' do
      #   user = build(:user, first_name_kana: "kana")
      it 'first_name_kanaがカタカナでないと登録できない'do
        @user.first_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字(カナ)を使用してください")
      end
    end
end
