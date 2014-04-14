class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :manufacturer
      t.string :model_number
      t.decimal :price
      t.string :description
      t.integer :retailer_id

      t.timestamps
    end
  end
end
