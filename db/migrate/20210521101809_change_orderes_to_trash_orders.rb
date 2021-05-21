class ChangeOrderesToTrashOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :orderes, :orders
  end
end
