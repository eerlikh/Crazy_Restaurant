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
    party = Party.find(params[:id])
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
