class ChangeColumnSnToOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :sn, :integer, null: true
  end
end
