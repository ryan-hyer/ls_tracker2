class CreateListingStandards < ActiveRecord::Migration
  def change
    create_table :listing_standards do |t|
      t.integer :listing_id
      t.integer :standard_id

      t.timestamps
    end
    add_index :listing_standards, :listing_id
    add_index :listing_standards, :standard_id
  end
end
