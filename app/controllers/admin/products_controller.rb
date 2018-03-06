class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.page(params[:page]).per(20)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_root_path, notice: "added product successfully"
    else
      render :new, alert: "something wrong!!"
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :image, :description, :price)
  end
end
