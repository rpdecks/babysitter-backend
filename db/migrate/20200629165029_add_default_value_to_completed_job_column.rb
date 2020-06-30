class AddDefaultValueToCompletedJobColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :completed, :boolean, :default => false
  end
end
