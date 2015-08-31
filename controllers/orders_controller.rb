class OrdersController < ApplicationController

  # '/orders'
  get '/' do
    # binding.pry
    @orders = Order.all
    @parties = Party.all
    erb :'orders/index'
  end

  # '/orders/new'
  get '/new' do
    @inventory_items = InventoryItem.all
    @parties = Party.all
    erb :'orders/new'
  end

  # '/orders'
  post '/' do
    # binding.pry
    # {"order"=>{"party_id"=>"7"}, "inventory_items"=>["10", "11"]}

    party_id = params['party_id']
    inventory_items =  params['inventory_items']

    inventory_items.each do |inventory_item|
      Order.create({
        party_id: party_id,
        inventory_item_id: inventory_item
        })
    end
  # Order.create(params[:order])
  redirect '/'
  end

  # '/orders/:id/edit'
  get '/:id/edit' do
    @order = Order.find(params[:id])
    erb :'orders/edit'
  end
  # '/orders/:id'
  put '/:id' do
    order = Order.find(params[:id])
    order.update(params[:order])
    redirect "/"
  end

  delete '/:id' do
    # Delete instance here
    Order.delete(params[:id])
    redirect '/'
  end


end
