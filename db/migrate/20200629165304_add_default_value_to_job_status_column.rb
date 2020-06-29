class AddDefaultValueToJobStatusColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :status, :string, :default => "incomplete"
  end
end
