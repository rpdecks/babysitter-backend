class DeleteUsernameFromCaregiversTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :caregivers, :username, :string
  end
end
