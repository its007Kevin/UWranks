class ChangeJobIdToString < ActiveRecord::Migration[5.1]
  def change
    change_column :jobs, :jobId, :string
  end
end
