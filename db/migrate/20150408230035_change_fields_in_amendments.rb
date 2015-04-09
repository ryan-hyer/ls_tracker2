class ChangeFieldsInAmendments < ActiveRecord::Migration
  def change
		change_table :amendments do |t|
		  t.rename :type, :project_type
		end
	end
end
