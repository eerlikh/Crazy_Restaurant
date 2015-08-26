class Order < ActiveRecord::Base
  belongs_to :inventory_item
  belongs_to :party
end
