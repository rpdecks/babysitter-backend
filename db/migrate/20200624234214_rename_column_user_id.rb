class RenameColumnUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :favorites, :favoritor_id, :user_id
  end
end
