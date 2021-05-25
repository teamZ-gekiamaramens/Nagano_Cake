class ChangeCreateStatusOfOrderDetails < ActiveRecord::Migration[5.2]
  def up
    change_column :order_details, :create_status, :integer, default: 0
  end
  
  def down
    change_column :order_details, :create_status, :integer
  end
end
