class CreateUserfriends < ActiveRecord::Migration[5.0]
  def change
    create_table :userfriends do |t|
    	t.integer :user_id
    	t.string :fname
    	t.integer :userfriend_id
      t.timestamps
    end
  end
end
