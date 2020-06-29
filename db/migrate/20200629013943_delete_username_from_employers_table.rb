class DeleteUsernameFromEmployersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :employers, :username, :string
  end
end
