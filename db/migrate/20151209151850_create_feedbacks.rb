class CreateFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :passenger_id, :integer

    change_table :feedbacks do |t|
      t.integer :user_id
      t.string :type
      t.integer :target_id
    end
  end
end
