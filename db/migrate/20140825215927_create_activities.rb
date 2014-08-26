class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :gold
      t.string :location
      t.boolean :flag

      t.timestamps
    end
  end
end
