class SessionsController < ApplicationController
	def new
	end

	def create
		retailer = Retailer.find_by(contact: params[:session][:contact].downcase)
		if retailer && retailer.authenticate(params[:session][:password])
			sign_in retailer
			redirect_to retailer
		else
			flash[:error] = 'Invalid contact number/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
