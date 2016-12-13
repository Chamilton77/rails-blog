class DropFnamePosts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :posts, :fname
  end
end
