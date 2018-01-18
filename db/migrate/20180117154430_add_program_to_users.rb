class AddProgramToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :program, :string
  end
end
