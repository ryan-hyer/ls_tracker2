class RemoveFieldsFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :delisted, :boolean
    remove_column :clients, :suspended, :boolean
  end
end
