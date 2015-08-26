require 'bundler'
Bundler.require()

# MODELS
require './models/inventory_item'
require './models/order'
require './models/party'

#CONTROLLERS
require './controllers/application_controller'
require './controllers/welcome_controller'
require './controllers/inventory_items_controller'
require './controllers/parties_controller'
require './controllers/orders_controller'


#ROUTING
map('/'){ run WelcomeController }
map('/parties') { run PartiesController }
map('/inventory_items') { run InventoryItemsController }
map('/orders'){ run OrdersController }
