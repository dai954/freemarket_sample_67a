class ChangeDataStatusItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :status, :integer
  end
end
