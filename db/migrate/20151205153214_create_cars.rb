class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :type
      t.integer :seats
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
