class AddEndDateColumnToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :end_date, :date
  end
end
