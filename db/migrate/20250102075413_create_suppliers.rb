class CreateSuppliers < ActiveRecord::Migration[7.2]
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.string :person_in_charge
      t.string :contact_number
      t.string :address

      t.timestamps
    end
  end
end
