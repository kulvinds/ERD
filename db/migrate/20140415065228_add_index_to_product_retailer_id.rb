class AddIndexToProductRetailerId < ActiveRecord::Migration
  def change
  	add_index :products, [:retailer_id, :created_at]
  end
end
