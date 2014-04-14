class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name
      t.string :address
      t.string :contact

      t.timestamps
    end
  end
end
