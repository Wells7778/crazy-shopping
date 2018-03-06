class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :price
      t.integer :quantity
      t.integer :product_id, null: false
      t.integer :order_id
      t.timestamps
    end
  end
end
