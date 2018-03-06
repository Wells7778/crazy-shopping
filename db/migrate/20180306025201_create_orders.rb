class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :sn, null: false
      t.integer :amount
      t.string  :name
      t.string  :phone
      t.string  :address, null: false
      t.string  :payment_status, defalult: "Not Paid"
      t.string  :shipping_status, default: "Not Shipped"
      t.timestamps
    end
  end
end
