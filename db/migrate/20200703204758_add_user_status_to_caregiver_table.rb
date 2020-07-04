class AddUserStatusToCaregiverTable < ActiveRecord::Migration[6.0]
  def change
    add_column :caregivers, :status, :string, :default => "active"
  end
end
