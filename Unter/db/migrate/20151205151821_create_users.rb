class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.float :rating_avg
      t.integer :phone_number
      t.text :description
      t.string :avatar

      t.timestamps null: false
    end
  end
end
