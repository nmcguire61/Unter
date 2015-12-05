class FixCarsType < ActiveRecord::Migration
  def change
    rename_column :cars, :type, :brand
  end
end
