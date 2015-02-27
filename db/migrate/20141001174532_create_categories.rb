class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :description
      t.integer :scheme_id

      t.timestamps
    end
  end
end
