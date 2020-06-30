class AddTitleToJobsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :title, :text
  end
end
