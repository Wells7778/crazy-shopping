class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  belongs_to :user

  def add_cart_items_to_order_items(cart)
    cart.cart_items.each do |item|
      self.order_items.create(quantity: item.quantity, price: item.product.price, product_id: item.product.id)
    end
  end
end
