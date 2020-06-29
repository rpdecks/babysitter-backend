class AddAvailableColumnBooleanToJobOpportunitiesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :job_opportunities, :available, :boolean
  end
end