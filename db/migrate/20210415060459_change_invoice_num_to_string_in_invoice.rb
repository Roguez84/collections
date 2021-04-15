class ChangeInvoiceNumToStringInInvoice < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :invoices do |t|
        dir.up { t.change :invoice_num, :string }
        dir.down { t.change :invoice_num, :integer }
      end
    end
  end
end
