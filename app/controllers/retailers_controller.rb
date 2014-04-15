class RetailersController < ApplicationController
  before_action :signed_in_retailer, only: [:edit,:update]
  before_action :correct_retailer, only: [:edit, :update]

  def show
  	@retailer = Retailer.find(params[:id])
    @product = @retailer.products.build
    @products = @retailer.products.paginate(page: params[:page])
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

  def edit
    @retailer = Retailer.find(params[:id])
  end

  def update
    @retailer = Retailer.find(params[:id])
    if @retailer.update_attributes(retailer_params)
      flash[:success] = "Profile Updated..."
      redirect_to @retailer
    else
      render 'edit'
    end 
  end

  private

  	def retailer_params
  		params.require(:retailer).permit(:name, :contact, :address, :password, :password_confirmation)
  	end

    def correct_retailer
      @retailer = Retailer.find(params[:id])
      redirect_to(root_url) unless current_retailer?(@retailer)
    end
end
