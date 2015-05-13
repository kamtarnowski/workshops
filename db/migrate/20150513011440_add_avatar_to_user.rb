class AddAvatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string, default: 'anonim.png'
    add_index :users, :avatar
  end
end
