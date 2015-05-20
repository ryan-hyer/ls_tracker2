class AddFieldsToFacility < ActiveRecord::Migration
  def change
    add_column :facilities, :latitude, :float
    add_column :facilities, :longitude, :float
    add_column :facilities, :last_geocoded, :date
  end
end
