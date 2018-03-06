class Product < ApplicationRecord
  validates_presence_of :name, :description, :price
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items
end
