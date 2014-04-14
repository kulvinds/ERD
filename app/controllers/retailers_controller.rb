class RetailersController < ApplicationController
  def new
  end

  def show
  	@retailer = Retailer.find(params[:id])
  end

  def new
  	@retailer = Retailer.new
  end

  def create
  	@retailer = Retailer.new(retailer_params)
  	if @retailer.save
      sign_in @retailer
  		flash[:success] = "Welcome to ERD"
  		redirect_to @retailer
  	else
  		render 'new'
  	end
  end

  private
  	def retailer_params
  		params.require(:retailer).permit(:name, :contact, :address, :password, :password_confirmation)
  	end
end
