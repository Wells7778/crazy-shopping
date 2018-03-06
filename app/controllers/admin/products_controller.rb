class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.page(params[:page]).per(20)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_root_path, notice: "add product successfully"
    else
      flash[:alert] =  "something wrong!!"
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_root_path, notice: "update product successfully"
    else
      flash[:alert] =  "something wrong!!"
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :image, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
