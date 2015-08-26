class WelcomeController < ApplicationController

  get '/' do
    @orders = Order.all
    @parties = Party.all
    @inventory_items = InventoryItem.all
    erb :index
  end

end
