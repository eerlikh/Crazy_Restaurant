class WelcomeController < ApplicationController

  get '/' do
    @orders = Order.all
    @parties = Party.all
    @inventory_items = InventoryItem.all
    # binding.pry
    #@orders.select { |order| order.party_id = 5 }
    erb :index
  end

end
