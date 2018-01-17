class AddForeignKeysToRankings < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :rankings, :users
  	add_foreign_key :rankings, :jobs
  end
end
