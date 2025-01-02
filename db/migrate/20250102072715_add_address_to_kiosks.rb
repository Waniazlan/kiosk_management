class AddAddressToKiosks < ActiveRecord::Migration[7.2]
  def change
    add_column :kiosks, :address, :string
  end
end
