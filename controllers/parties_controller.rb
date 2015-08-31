class PartiesController < ApplicationController

  # '/parties'
  get '/' do
    @parties = Party.all
    erb :'parties/index'
  end

  # '/parties/new'
  get '/new' do
    erb :'parties/new'
  end

  # '/parties'
  post '/' do
    Party.create(params[:party])
    redirect '/'
  end

  # '/parties/:id/edit'
  get '/:id/edit' do
    @party = Party.find(params[:id])
    erb :'parties/edit'
  end
  # '/parties/:id'
    put '/:id' do
      def total(orders)
            total = 0
            orders.each do |order|
            total += order.inventory_item.price
          end
        total
      end
    @total = total
    @party = Party.find(params[:id])
    @orders = @party.inventory_items
    party.update(params[:party])
    redirect "/parties/#{party.id}"
  end

  delete '/:id' do
    # Delete instance here
    party = Party.find(params[:id])
    party.orders.each {|order| order.delete }
    party.delete()
    redirect '/'
  end

end
