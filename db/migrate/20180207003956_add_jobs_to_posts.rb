class AddJobsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :job_id, :integer
    add_foreign_key :posts, :jobs
  end
end
