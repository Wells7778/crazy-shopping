class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.all
  end

  def create
    @cart = current_cart
    @order = current_user.orders.build(order_params)
    @order.amount = @cart.total_price
    @order.sn = (Time.now.to_i.to_s[0..4] + @cart.id.to_s).to_i
    @order.save!
    @order.add_cart_items_to_order_items(@cart)
    @cart = Cart.create
    session[:cart_id] = @cart.id
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:name, :phone, :address)
  end
end
