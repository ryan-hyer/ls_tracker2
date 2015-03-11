class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :number
      t.string :model
      t.date :sample_received
      t.date :report_received
      t.integer :inspection_id
      t.integer :standard_id
      t.integer :project_id
      t.text :comments

      t.timestamps
    end
    add_index :tests, :inspection_id
  end
end
