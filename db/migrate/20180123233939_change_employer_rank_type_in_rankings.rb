class ChangeEmployerRankTypeInRankings < ActiveRecord::Migration[5.1]
  def change
    change_column :rankings, :employerRank, :string
  end
end
