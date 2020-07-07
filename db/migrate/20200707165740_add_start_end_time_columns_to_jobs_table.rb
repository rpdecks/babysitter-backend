class AddStartEndTimeColumnsToJobsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :start_time, :datetime
    add_column :jobs, :end_time, :datetime
  end
end
