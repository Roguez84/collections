class RemoveEmailFromPatient < ActiveRecord::Migration[5.2]
  def change
    remove_column :patients, :email, :string
  end
end
