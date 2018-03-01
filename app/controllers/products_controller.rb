class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)
    @cart_item = current_cart.cart_items.find_by(product_id: @product)
    respond_to do |format|
      format.js
    end
  end

  def subtract_from_cart
    @product = Product.find(params[:id])
    current_cart.subtract_cart_item(@product)
    @cart_item = current_cart.cart_items.find_by(product_id: @product)
    respond_to do |format|
      format.js
    end
  end

  def remove_from_cart
    @product = Product.find(params[:id])
    @cart_item = current_cart.cart_items.find_by(product_id: @product)
    current_cart.remove_cart_item(@product)

    respond_to do |format|
      format.js
    end
  end
end
