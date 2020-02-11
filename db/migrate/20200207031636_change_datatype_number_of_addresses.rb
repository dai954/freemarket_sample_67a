class ChangeDatatypeNumberOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :number, :string
  end
end
