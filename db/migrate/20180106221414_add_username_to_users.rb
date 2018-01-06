class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change # anything inside of this method is translated into SQL code and modifies the database 
  	add_column :users, :username, :string # add a new column to table "users", called "username" and of type "string"
  	add_index :users, :username, unique: true # First, index usernames for quick lookup. Second, ensure usernames are unique
  end
end
