class RemoveColumnFavoritorId < ActiveRecord::Migration[6.0]
  def change
    remove_column :favorites, :favorited_id, :integer
  end
end
