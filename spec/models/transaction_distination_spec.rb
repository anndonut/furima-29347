require 'rails_helper'

RSpec.describe TransactionDistination, type: :model do
  describe '購入情報の保存' do
    before do
      @transaction_distination = FactoryBot.build(:transaction_distination)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@transaction_distination).to be_valid
    end

    it 'building_nameは空でも保存できること' do
      @transaction_distination.building_name = nil
      expect(@transaction_distination).to be_valid
    end
  
    it 'post_codeが空だと保存できないこと' do
      @transaction_distination.post_code = nil
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @transaction_distination.post_code = '1234567'
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'prefecture_code_idを選択していないと保存できないこと' do
      @transaction_distination.prefecture_code_id = "0"
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("Prefecture code must be other than 0")
    end


    it 'cityが空だと保存できないこと' do
      @transaction_distination.city = nil
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("City can't be blank")
    end

  
    it 'house_numberが空だと保存できないこと' do
      @transaction_distination.house_number = nil
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @transaction_distination.phone_number = nil
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("Phone number can't be blank")
    end


    it 'phone_numberがハイフンを含んでいると保存できないこと' do
      @transaction_distination.phone_number = '090-0000-0000'
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("Phone number is invalid. Not include hyphen(-)")
    end


    it 'phone_numberが12桁以上の場合は保存できないこと' do
      @transaction_distination.phone_number = '0900000000000'
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("Phone number is invalid. Not include hyphen(-)", "Phone number is too long (maximum is 12 characters)")
    end

    it 'tokenが空だと保存できないこと' do
      @transaction_distination.token = nil
      @transaction_distination.valid?
      expect(@transaction_distination.errors.full_messages).to include("Token can't be blank")
    end
    
    
  

  end
end