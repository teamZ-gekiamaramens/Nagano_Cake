class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.boolean :is_active
      t.timestamp :created_at
      t.timestamp :update_at

      t.timestamps
    end
  end
end
