class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.integer :client_id
      t.string :name
      t.text :address
      t.string :phone
      t.string :poc_name
      t.string :poc_phone
      t.string :poc_email
      t.boolean :inactive
      t.text :comments

      t.timestamps
    end
  end
end
