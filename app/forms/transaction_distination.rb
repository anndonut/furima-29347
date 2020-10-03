class TransactionDistination
 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code,:prefecture_code_id, :city,:house_number,:building_name, :phone_number, :token
  validates :token, :prefecture_code_id, :city, :house_number,  presence: true

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: '' } do 
    validates :post_code
  end

  with_options presence: true, format: { with: /\A\d{11}\z/, message: '' } do 
    validates :phone_number
  end




def save
  # user = User.create(firstname : firstname,family_name :family_name, nickname :nickname)
  # item = Item.create(name: name, selling_price : selling_price)
  transaction = Transaction.create(user_id:user_id, item_id:item_id)
  SendingDestination.create(post_code:post_code,prefecture_code_id:prefecture_code_id, city:city,house_number:house_number,building_name:building_name,phone_number:phone_number,transaction_id:transaction.id)
end



end