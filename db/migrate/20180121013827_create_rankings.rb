class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.integer :employerRank
      t.integer :yourRank
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
