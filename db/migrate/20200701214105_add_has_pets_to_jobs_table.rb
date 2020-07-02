class AddHasPetsToJobsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :has_pets, :boolean
  end
end
