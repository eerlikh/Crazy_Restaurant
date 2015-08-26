class Party < ActiveRecord::Base
  has_many :orders
  has_many :inventory_items, through: :orders
end
