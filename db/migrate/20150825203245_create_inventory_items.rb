class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.string :cuisine_type
      t.string :nutritional_value
      t.date :expiration_date
      t.string :description
      t.timestamps
    end
  end
end
