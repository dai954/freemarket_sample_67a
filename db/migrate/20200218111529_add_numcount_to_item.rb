class AddNumcountToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :like_count, :integer
  end
end
