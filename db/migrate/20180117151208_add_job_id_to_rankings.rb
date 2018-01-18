class AddJobIdToRankings < ActiveRecord::Migration[5.1]
  def change
    add_column :rankings, :job_id, :integer
  end
end
