class Item < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_one_attached :image
  validates :image, presence:true, unless: :was_attached?
  # has_one :transaction, class_name: "Transaction"


  def was_attached?
    self.image.attached?
  end


    #選択が「--」のままになっていないか
    with_options numericality: { other_than: 1 } do
      validates :category_id,:condition_id,:shipping_expense_id,:ship_from_area_id,:processing_time_id
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_expense
  belongs_to_active_hash :ship_from_area
  belongs_to_active_hash :processing_time

  # validates :image ,:name,:introduction, :category_id, :shipping_expense_id, :ship_from_area_id, :processing_time_id, :selling_price,  presence: true

  # validates :selling_price, inclusion: {in: 300..9999999}

  # with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  #   validates :selling_price
  # end

end
