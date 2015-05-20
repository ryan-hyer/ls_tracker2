class ChangeFieldsInFacilities < ActiveRecord::Migration
  def change
  	change_column :facilities, :last_geocoded, :string
  end
end
