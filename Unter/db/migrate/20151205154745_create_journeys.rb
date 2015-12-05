class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :starting_point
      t.string :ending_point
      t.datetime :starting_time
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
