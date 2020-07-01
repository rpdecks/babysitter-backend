class AddStartDateColumnToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :start_date, :date
  end
end
