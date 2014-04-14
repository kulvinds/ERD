class AddRememberTokenToRetailers < ActiveRecord::Migration
	def change
		add_column :retailers, :remember_token, :string
		add_index  :retailers, :remember_token
	end
end
