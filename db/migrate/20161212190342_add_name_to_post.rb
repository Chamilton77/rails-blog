class AddNameToPost < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :posts, :fname, :string
  end
end
