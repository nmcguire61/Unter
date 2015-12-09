class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :journey_id
      t.integer :journey_cost
      t.integer :profit
    end
  end
end
