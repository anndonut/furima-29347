require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)

  end

  
    # name,introduction,category,condition,shipping_expense,ship_from_area,prossing_time,selling_priceがあれば出品できること
    it 'name,introduction,category,condition,shipping_expense,ship_from_area,processing_time,selling_priceがあれば出品できる' do
      expect(@item).to be_valid
    end
    


    # 画像が空だと出品できないこと
    it '画像が空だと出品できない'do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
    end

    # 商品名が空だと出品できないこと
    it '商品名が空だと出品できない'do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Name can't be blank")
    end



    # 商品の説明が空だと出品できないこと
    it '商品の説明が空だと出品できない'do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Introduction can't be blank")
    end


    # カテゴリーの情報が空だと出品できないこと
    it 'カテゴリーが空だと出品できない'do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
    end


    # 商品の状態についての情報が空だと出品できないこと
    it '商品の状態が空だと出品できない'do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Condition is not a number")
    end


    # 配送料の負担についての情報が空だと出品できないこと
    it '配送料の負担が空だと出品できない'do
      @item.shipping_expense = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Shipping expense can't be blank")
    end

    # 発送元の地域についての情報が空だと出品できないこと
    it '配送先の地域が空だと出品できない'do
      @item.ship_from_area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Ship from area can't be blank")
    end

    # 発送までの日数についての情報が空だと出品できないこと
    it '配送先の地域が空だと出品できない'do
      @item.processing_time = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Processing time can't be blank")
    end


    # 価格についての情報が空だと出品できないこと
    it '価格が空だと出品できない'do
      @item.selling_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Selling price is not a number")
    end

    # 価格の範囲が、¥300以下では出品できないこと
    it '価格の範囲が、¥300以下では出品できないこと'do
      @item.selling_price  = 200
      @item.valid?
      expect(@item.errors.full_messages).to include ("Selling price must be greater than or equal to 300")
   end

   # 価格の範囲が、¥9,999,999以上では出品できないこと
   it '価格の範囲が、¥9,999,999以上では出品できないこと'do
    @item.selling_price  = 10,000,000
    @item.valid?
    expect(@item.errors.full_messages).to include ( "Selling price is not a number")
  end 


    # 販売価格は半角数字のみ保存可能であること
    it '販売価格は半角数字でなければ出品できない'do
    @item.selling_price  = "あいうえお"
    @item.valid?
    expect(@item.errors.full_messages).to include ("Selling price is not a number")
    end

end