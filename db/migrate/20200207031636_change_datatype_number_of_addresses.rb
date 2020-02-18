class ChangeDatatypeNumberOfAddresses < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :number, :string
  end
end
