class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :Job_id
      t.string :Company
      t.string :Position
      t.string :Location
      t.integer :Openings

      t.timestamps
    end
  end
end
