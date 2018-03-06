class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(24)
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)
    @cart_item = current_cart.cart_items.find_by(product_id: @product)
    respond_to do |format|
      format.js
    end
  end

  def adjust_item
    @product = Product.find(params[:id])
    @cart_item = current_cart.cart_items.find_by(product_id: @product)
    respond_to do |format|
      if params[:type] == "add"
        @cart_item.quantity += 1
        @cart_item.save!
        format.js
      elsif params[:type] == "subtract"
        @cart_item.quantity -= 1
        @cart_item.save!
        format.js
      end
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
