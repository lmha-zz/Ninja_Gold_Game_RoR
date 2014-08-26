class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :location
      t.integer :gold_min
      t.integer :gold_max

      t.timestamps
    end
  end
end
