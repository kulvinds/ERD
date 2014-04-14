module SessionsHelper
	def sign_in(retailer)
		remember_token = Retailer.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		retailer.update_attribute(:remember_token, Retailer.hash(remember_token))
		self.current_retailer = retailer
	end

	def current_retailer=(retailer)
		@current_retailer = retailer
	end

	def current_retailer
		remember_token = Retailer.hash(cookies[:remember_token])
		@current_retailer ||= Retailer.find_by(remember_token: remember_token)
  	end

	def signed_in?
		!current_retailer.nil?
	end

	def sign_out
		current_retailer.update_attribute(:remember_token, Retailer.hash(Retailer.new_remember_token))
		cookies.delete(:remember_token)
		self.current_retailer = nil
	end
end
