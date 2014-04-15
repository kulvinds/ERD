class Product < ActiveRecord::Base
	belongs_to :retailer
	default_scope -> { order('created_at DESC')}
	validates :retailer_id, presence: true
	validates :description, length: { maximum:140 }
end
