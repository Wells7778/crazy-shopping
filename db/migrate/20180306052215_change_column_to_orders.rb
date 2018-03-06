class ChangeColumnToOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :sn, :integer
  end
end
