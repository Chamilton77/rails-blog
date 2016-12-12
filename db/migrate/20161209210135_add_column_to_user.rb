class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :passwords, :string
  end
end
