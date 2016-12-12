class RenamePassColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :passwords, :password
  end
end
