class RemoveTotalFromInvoice < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :total, :decimal
  end
end
