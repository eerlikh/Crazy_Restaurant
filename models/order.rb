class Order < ActiveRecord::Base
  belongs_to :inventory_item
  belongs_to :party
end

def self.total(orders)
    total = 0
    orders.each do |order|
      total += order.inventory_item.price
    end
    total
  end
