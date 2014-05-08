class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :website
      t.string :poc_name
      t.string :poc_title
      t.string :poc_phone
      t.string :poc_email
      t.integer :invoice_amt
      t.string :invoice_freq
      t.string :invoice_month
      t.string :listing_number
      t.date :effective
      t.date :updated
      t.date :expires
      t.boolean :suspended
      t.boolean :delisted
      t.text :comments

      t.timestamps
    end
  end
end
