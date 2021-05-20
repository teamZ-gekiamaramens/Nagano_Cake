class AddLatsNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :address, :text
    add_column :customers, :address_number, :integer
    add_column :customers, :phone_number, :string
    add_column :customers, :withdrawal, :boolean, default:false,null:false
  end
end
