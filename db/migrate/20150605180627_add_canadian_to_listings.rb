class AddCanadianToListings < ActiveRecord::Migration
  def change
    add_column :listings, :has_canada, :boolean
  end
end
