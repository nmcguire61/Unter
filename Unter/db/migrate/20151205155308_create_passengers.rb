class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.integer :user_id
      t.integer :journey_id
      t.string :status
      t.float :price

      t.timestamps null: false
    end
  end
end
