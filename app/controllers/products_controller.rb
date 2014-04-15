class ProductsController < ApplicationController
  before_action :signed_in_retailer, only: [:create, :update, :destroy]
  before_action :correct_retailer, only: :destroy
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_retailer.products.build(product_params)    
    if @product.save
      flash[:success] = "Product created..."
      redirect_to current_retailer
    else
      flash[:error] = "Product creation Failed, Try again..."
      redirect_to current_retailer
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    redirect_to current_retailer
  end

  def search
    @products = Product.search do
        keywords params[:query]
    end.results
    render "pages/search_results"    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:manufacturer, :model_number, :price, :description, :retailer_id)
    end

    def correct_retailer
      @product = current_retailer.products.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
    end
end
