class AddAvgRatToProduct < ActiveRecord::Migration
  def change
    add_column :products, :average_rat, :float, default: 0
    add_index :products, :average_rat
  end
end
