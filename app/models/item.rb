class Item < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_one_attached :image
  validates :image, presence:true, unless: :was_attached?
  # has_one :transaction, class_name: "Transaction"


  def was_attached?
    self.image.attached?
  end

  validates :name,:introduction, :category_id, :shipping_expense_id, :ship_from_area_id, :processing_time_id,   presence: true

    #選択が「--」のままになっていないか
    with_options numericality: { other_than: 0 } do
      validates :category_id,:condition_id,:shipping_expense_id,:ship_from_area_id,:processing_time_id
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_expense
  belongs_to_active_hash :ship_from_area
  belongs_to_active_hash :processing_time


  # with_options presence: true, format: { message: 'Name can't be blank' } do
  #   validates :name
  # end


 

  # validates :selling_price, inclusion: {in: 300..9999999}

  validates :selling_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}


  # with_options presence: true, :numericality { with: /\A[0-9]+\z/, message: 'Selling price 半角数字を使用してください' } do
  #   validates :selling_price
  # end

  
  validates :selling_price, numericality: { only_integer: true } 
  


end
