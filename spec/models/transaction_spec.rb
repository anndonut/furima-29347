# require 'rails_helper'

# RSpec.describe Transaction, type: :model do
#   before do
#     @transaction = FactoryBot.build(:transaction)
#   end

#   it "priceがあれば保存ができること" do
#     expect(@transaction).to be_valid
#   end

#   it "priceが空では保存ができないこと" do
#     @transaction.price = nil
#     @transaction.valid?
#     expect(@transaction.errors.full_messages).to include("Price can't be blank")
#   end

#   # it "クレジットカード情報が空では保存できないこと" do
#   #   @transaction.token = nil
#   #   @transaction.valid?
#   #   expect(@transaction.errors.full_messages).to include("Credit card information can't be blank")
#   # end



# end