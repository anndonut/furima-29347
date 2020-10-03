class SendingDestination < ApplicationRecord
belongs_to :trade, class_name:"Transaction", foreign_key: "transaction_id"


extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code


end
