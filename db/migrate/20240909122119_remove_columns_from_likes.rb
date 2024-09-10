class RemoveColumnsFromLikes < ActiveRecord::Migration[7.2]
  def change
    remove_column :likes, :total_like, :bigint
  end
end
