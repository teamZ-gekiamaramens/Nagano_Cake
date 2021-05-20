class AddGenreIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :Genre_id, :integer
  end
end
