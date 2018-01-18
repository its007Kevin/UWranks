class AddUserIdToRankings < ActiveRecord::Migration[5.1]
  def change
    add_column :rankings, :user_id, :integer
  end
end
