class AddIndexToRetailerContact < ActiveRecord::Migration
  def change
  	add_index :retailers, :contact, unique: true
  end
end
