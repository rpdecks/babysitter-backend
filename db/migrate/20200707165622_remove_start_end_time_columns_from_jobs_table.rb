class RemoveStartEndTimeColumnsFromJobsTable < ActiveRecord::Migration[6.0]
  def change
    remove_columns :jobs, :start_time, :end_time
  end
end
