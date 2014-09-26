class AddTitleToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :title, :string
  end
end
