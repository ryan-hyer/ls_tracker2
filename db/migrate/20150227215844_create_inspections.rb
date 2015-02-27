class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.string :number
      t.integer :facility_id
      t.date :inspection_date
      t.text :comments

      t.timestamps

    end
    add_index :inspections, :facility_id
  end
end
