class CreateAttendantShifts < ActiveRecord::Migration[7.2]
  def change
    create_table :attendant_shifts do |t|
      t.references :kiosk, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
