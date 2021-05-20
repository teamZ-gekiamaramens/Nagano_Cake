class CreateOrderes < ActiveRecord::Migration[5.2]
  def change
    create_table :orderes do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :name
      t.string :address
      t.integer :shipping
      t.integer :total
      t.integer :payment
      t.integer :order_status

      t.timestamps
    end
  end
end
