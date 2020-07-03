class ChangeJobTableLocationColumnNameToJobLocation < ActiveRecord::Migration[6.0]
  def change
    rename_column :jobs, :location, :job_location
  end
end
