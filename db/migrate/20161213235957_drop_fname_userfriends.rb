class DropFnameUserfriends < ActiveRecord::Migration[5.0]
  def change
  	remove_column :userfriends, :fname
  end
end
