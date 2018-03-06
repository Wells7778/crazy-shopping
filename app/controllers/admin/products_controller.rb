class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.page(params[:page]).per(20)
  end

end
