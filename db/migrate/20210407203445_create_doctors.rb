class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :RUT, null: false
      t.string :names
      t.string :surnames
      t.string :specialty
      t.string :email

      t.timestamps
    end
  end
end
