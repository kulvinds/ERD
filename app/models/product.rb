class Product < ActiveRecord::Base
	belongs_to :retailer
	default_scope -> { order('created_at DESC')}
	validates :retailer_id, :manufacturer, :model_number, :price, presence: true
	validates :description, length: { maximum:140 }

	searchable do
		text :manufacturer, :model_number, :description
	end
end
