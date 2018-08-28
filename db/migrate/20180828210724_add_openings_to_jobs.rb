class AddOpeningsToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :openings, :integer
  end
end
