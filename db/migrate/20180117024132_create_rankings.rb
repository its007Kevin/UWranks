class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.string :Employer_ranking
      t.string :My_ranking

      t.timestamps
    end
  end
end
