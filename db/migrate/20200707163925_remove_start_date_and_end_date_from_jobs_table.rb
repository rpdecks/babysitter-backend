class RemoveStartDateAndEndDateFromJobsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :start_date, :date
    remove_column :jobs, :end_date, :date
  end
end
