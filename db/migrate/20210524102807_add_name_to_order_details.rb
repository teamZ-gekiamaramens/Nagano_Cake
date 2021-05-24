class AddNameToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :item_id, :integert
    add_column :order_details, :quantity, :integer
    add_column :order_details, :price, :integer
    add_column :order_details, :create_status, :integer
    add_column :order_details, :order_id, :integer
  end
end
