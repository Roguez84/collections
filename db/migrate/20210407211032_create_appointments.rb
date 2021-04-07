class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date_time, null: false
      t.integer :cost
      t.belongs_to :patient, foreign_key: true
      t.belongs_to :doctor, foreign_key: true
      t.belongs_to :invoice, foreign_key: true

      t.timestamps
    end
  end
end
