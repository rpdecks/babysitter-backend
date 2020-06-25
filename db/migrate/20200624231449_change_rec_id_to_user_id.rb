class ChangeRecIdToUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :conversations, :recipient_id, :user_id
  end
end