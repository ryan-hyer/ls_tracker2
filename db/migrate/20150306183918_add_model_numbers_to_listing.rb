class AddModelNumbersToListing < ActiveRecord::Migration
  def change
    add_column :listings, :model_numbers, :text
  end
end
