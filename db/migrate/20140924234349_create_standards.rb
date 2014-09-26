class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :number
      t.string :revision

      t.timestamps
    end
  end
end
