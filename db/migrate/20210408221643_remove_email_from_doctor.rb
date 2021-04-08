class RemoveEmailFromDoctor < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :email, :string
  end
end
