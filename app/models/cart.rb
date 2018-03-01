class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_cart_item(product)
    existing_item = self.cart_items.find_by(product_id: product.id)
    if existing_item
      existing_item.quantity += 1
      existing_item.save!
    else
      cart_item = cart_items.build(product_id: product.id)
      cart_item.save!
    end
    self.cart_items
  end

  def subtract_cart_item(product)
    existing_item = self.cart_items.find_by(product_id: product.id)
    if existing_item && existing_item.quantity > 0
      existing_item.quantity -= 1
      existing_item.save!
    end
    if existing_item.quantity == 0
      remove_cart_item(product)
    end
  end
  def remove_cart_item(product)
    existing_item = self.cart_items.find_by(product_id: product.id)
    if existing_item
      existing_item.destroy
    end
  end

  def total_price
    cart_items.reduce(0) { |sum, cart_item | sum + cart_item.product.price * cart_item.quantity }
  end

  def total_quantity
    cart_items.reduce(0) { |sum, cart_item | sum + cart_item.quantity }
  end
end
