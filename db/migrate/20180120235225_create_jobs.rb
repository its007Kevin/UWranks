class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :jobId
      t.string :company
      t.string :position
      t.string :location

      t.timestamps
    end
  end
end
