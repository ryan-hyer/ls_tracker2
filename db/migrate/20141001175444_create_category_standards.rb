class CreateCategoryStandards < ActiveRecord::Migration
  def change
    create_table :category_standards do |t|
      t.integer :category_id
      t.integer :standard_id

      t.timestamps
    end

    add_index :category_standards, :category_id
    add_index :category_standards, :standard_id
    add_index :category_standards, [:category_id, :standard_id], unique: true
  end
end
