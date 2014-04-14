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
  	@retailer = retailer.new(retailer_params)
  	if @retailer.save
  		flash[:success] = "Welcome to ERD"
  		redirect_to @retailer
  	else
  		render 'new'
  	end
  end

  private
  	def retailer_params
  		params.require(:retailer).permit(:name,:contact,:password,:password_confirmation)
  	end
end
