class Product < ActiveRecord::Base
	belongs_to :retailer
	validates :description, length: { maximum:140 }
end
