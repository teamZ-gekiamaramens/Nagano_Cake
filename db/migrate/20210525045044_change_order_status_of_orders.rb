class ChangeOrderStatusOfOrders < ActiveRecord::Migration[5.2]
  # def change
  # change_column :orders, :order_status, :integer, default: 0
  # end
  def up
    change_column :orders, :order_status, :integer, default: 0
  end
   
  def down
    change_column :orders, :order_status, :integer
  end
end
