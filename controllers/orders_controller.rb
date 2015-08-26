class OrdersController < ApplicationController

  # '/orders'
  get '/' do
    @orders = Order.all
    erb :'orders/index'
  end

  # '/orders/new'
  get '/new' do
    @inventory_items = InventoryItem.all
    @scary_rides = ScaryRide.all
    erb :'orders/new'
  end

  # '/orders'
  post '/' do
    Order.create(params[:order])
    redirect '/'  
  end


end
