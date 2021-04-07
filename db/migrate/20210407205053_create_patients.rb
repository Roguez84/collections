class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :RUT, null: false
      t.string :names
      t.string :surnames
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
