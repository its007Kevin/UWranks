class RemoveCommenterFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :commenter, :string
  end
end
