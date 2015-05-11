class AddAvgRatToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :average_rating, :integer, default: 0
    add_index :categories, :average_rating
  end
end
