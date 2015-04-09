class CreateAmendments < ActiveRecord::Migration
  def change
    create_table :amendments do |t|
      t.string :number
      t.date :completed
      t.string :type
      t.integer :client_id
      t.integer :category_id
      t.text :models
      t.integer :old_facility_id
      t.integer :new_facility_id
      t.string :test_reports
      t.string :status

      t.timestamps
    end
    add_index :amendments, :client_id
  end
end
