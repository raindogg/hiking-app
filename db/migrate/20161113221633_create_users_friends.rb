class CreateUsersFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :users_friends do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
