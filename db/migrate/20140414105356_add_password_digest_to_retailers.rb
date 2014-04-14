class AddPasswordDigestToRetailers < ActiveRecord::Migration
  def change
    add_column :retailers, :password_digest, :string
  end
end
