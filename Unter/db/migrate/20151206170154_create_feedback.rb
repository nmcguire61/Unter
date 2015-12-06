class CreateFeedback < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :passenger_id
      t.text :comment
      t.integer :rating

      t.timestamps null: false
    end
  end
end
