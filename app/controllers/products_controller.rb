class ProductsController < ApplicationController

  def index
    @products = Product.all
    @cart_items = current_cart.cart_items.all
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)

    redirect_to root_path
  end

  def subtract_from_cart
    @product = Product.find(params[:id])
    current_cart.subtract_cart_item(@product)

    redirect_to root_path
  end

  def remove_from_cart
    @product = Product.find(params[:id])
    current_cart.remove_cart_item(@product)

    redirect_to root_path
  end
end
