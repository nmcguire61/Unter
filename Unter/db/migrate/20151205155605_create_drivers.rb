class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :user_id
      t.integer :journey_id
      t.string :status
      t.float :price

      t.timestamps null: false
    end
  end
end
