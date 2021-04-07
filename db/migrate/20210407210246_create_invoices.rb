class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :invoice_num
      t.integer :invoice_amt
      t.boolean :paid_status, default: false
      t.datetime :invoice_date

      t.timestamps
    end
  end
end
