class AddCommentsToAmendments < ActiveRecord::Migration
  def change
    add_column :amendments, :comments, :text
  end
end
