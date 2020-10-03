class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :sending_destination

  
  # attr_accessor :token
end
