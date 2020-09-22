require 'rails_helper'
bofore do
  @user = FactoryBot.build(:user)
end

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.erros.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.erros.full_messages).to include("Email can't be blank")
    end
    it "既に登録済みのemialは登録できない"

    end
    it "emailに@が含まれているいないと登録できない"
    end
    it "passwordが空だと登録できない"
    @user.password = ""
      @user.valid?
      expect(@user.erros.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字以上でないと登録できない"
    end
    it "passwordは半角英数字混合でないと登録できない"
    end
    it "passwordは確認用含めて2回入力が必須である"
    end
    it "first_nameとfamily_nameがそれぞれ空だと登録できない"
    end
    it "first_nameとfamily_nameはそれぞれ全角入力が必須である"
    end
    it "first_name_kanaとfamily_name_kanaはそれぞれ空だと登録できない"
    end
    it "first_name_kanaとfamily_name_kanaは全角（カタカナ）入力が必須である"
    end
    it "birth_dayば空だと登録できない"
      @user.birth_day = ""
      @user.valid?
      expect(@user.erros.full_messages).to include("Birth day can't be blank")
    end

  end
end
