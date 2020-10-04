class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :trade, class_name:"Transaction"


  validates :name,:introduction, :category_id, :shipping_expense_id, :ship_from_area_id, :processing_time_id,   presence: true
  validates :image, presence:true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end

  #選択が「--」のままになっていないか
  with_options numericality: { other_than: 0 } do
    validates :category_id,:condition_id,:shipping_expense_id,:ship_from_area_id,:processing_time_id
  end

  validates :selling_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  validates :selling_price, numericality: { only_integer: true } 
 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_expense
  belongs_to_active_hash :ship_from_area
  belongs_to_active_hash :processing_time

end
