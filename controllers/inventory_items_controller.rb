class InventoryItemsController < ApplicationController

  # '/inventory_items'
  get '/' do
    @inventory_items = InventoryItem.all
    erb :'inventory_items/index'
  end

  # '/inventory_items/new'
  get '/new' do
    erb :'inventory_items/new'
  end

  # '/inventory_items'
  post '/' do
    InventoryItem.create(params[:inventory_item])
    redirect '/'  
  end


end
