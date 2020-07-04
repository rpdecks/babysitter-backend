class AddUserStatusToEmployerTable < ActiveRecord::Migration[6.0]
  def change
    add_column :employers, :status, :string, :default => "active"
  end
end
