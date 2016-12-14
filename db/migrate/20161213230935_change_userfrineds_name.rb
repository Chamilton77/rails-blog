class ChangeUserfrinedsName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :userfriends, :userfriend_id, :friend_id
  end
end
