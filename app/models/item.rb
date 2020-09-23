class Item < ApplicationRecord
  belongs_to :user, class_name: "User"
  # has_one :transaction, class_name: "Transaction"
end
