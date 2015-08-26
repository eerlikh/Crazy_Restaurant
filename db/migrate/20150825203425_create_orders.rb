class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :inventory_item_id
      t.integer :party_id
      t.boolean :paid_status
      t.timestamps
    end
  end
end
