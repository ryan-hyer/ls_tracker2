class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :client_id
      t.integer :category_id
      t.text :product_description
      t.text :conditions
      t.text :comments

      t.timestamps
    end
    add_index :listings, :client_id
  end
end
