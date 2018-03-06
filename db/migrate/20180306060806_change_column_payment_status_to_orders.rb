class ChangeColumnPaymentStatusToOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :payment_status, :string, default: "Not Paid"
  end
end
