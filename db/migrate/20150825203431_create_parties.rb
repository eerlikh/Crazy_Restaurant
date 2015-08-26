class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :table_number
      t.integer :number_of_guests
      t.string :items_ordered
    end
  end
end
