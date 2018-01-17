class AddUserToRankings < ActiveRecord::Migration[5.1]
  def change
    add_column :rankings, :user_id, :integer
    add_foreign_key :rankings, :users
  end
end
