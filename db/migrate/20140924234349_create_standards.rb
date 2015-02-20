class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :number
      t.string :revision
      t.string :title
      t.string :exceptions

      t.timestamps
    end
  end
end
