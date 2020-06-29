class AddInterestedColumnToJobOpportunitiesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :job_opportunities, :interested, :boolean
  end
end