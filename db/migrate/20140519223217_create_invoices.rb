class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.integer :client_id
      t.string :description
      t.float :amount
      t.date :date_invoiced
      t.date :date_paid

      t.timestamps
    end
    add_index :invoices, :client_id
  end
end
