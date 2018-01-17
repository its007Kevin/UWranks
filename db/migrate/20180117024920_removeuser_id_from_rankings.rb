class RemoveuserIdFromRankings < ActiveRecord::Migration[5.1]
  def change
  	remove_column :rankings, :user_id, :integer
  	remove_column :rankings, :job_id, :integer
  end
end
