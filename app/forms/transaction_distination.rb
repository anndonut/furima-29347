class TransactionDistination
 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code,:prefecture_code_id, :city,:house_number,:building_name, :phone_number, :token
  validates :token, :prefecture_code_id, :city, :house_number,  presence: true

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)'} do 
    validates :post_code
  end

  with_options presence: true,format: { with: /\A\d{11}\z/, message: 'is invalid. Not include hyphen(-)' } do 
    validates :phone_number
  end

  validates :phone_number, presence: true, length: { maximum: 12 }

  # ,message: 'is too long(maximum is 12 character)'


   #選択が「--」のままになっていないか
   with_options numericality: { other_than: 0 } do
    validates :prefecture_code_id
  end





def save
  order = Order.create(user_id:user_id, item_id:item_id)
  SendingDestination.create(post_code:post_code,prefecture_code_id:prefecture_code_id, city:city,house_number:house_number,building_name:building_name,phone_number:phone_number,order_id:order.id)
end



end