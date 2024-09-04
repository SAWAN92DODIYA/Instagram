class RemoveColumnsFromUser < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :picture, :binary
  end
end
