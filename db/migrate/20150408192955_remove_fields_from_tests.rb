class RemoveFieldsFromTests < ActiveRecord::Migration
  def change
  	remove_column :tests, :standard_id, :integer
  	remove_column :tests, :project_id, :integer
  	remove_column :tests, :report_received, :date
  end
end
