class Item < ApplicationRecord
  belongs_to :user, class_name: "User"
  # has_one :transaction, class_name: "Transaction"

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition

    # :shipping_expense,:ship_from_area,:processing_time

    #選択が「--」のままになっていないか
    with_options numericality: { other_than: 1 } do
      validates :category_id,:condition_id,:shipping_expense_id,:ship_from_area_id,:processing_time_id
  end


  # validates :image ,:name,:introduction, :category_id, :shipping_expense_id, :ship_from_area_id, :processing_time_id, :selling_price,  presence: true

  # validates :selling_price, inclusion: {in: 300..9999999}

  # with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  #   validates :selling_price
  # end

end
