class TrimJobOpportunitiesColumnDown < ActiveRecord::Migration[6.0]
  def change
    remove_column :job_opportunities, :available, :boolean
    remove_column :job_opportunities, :interested, :boolean
    remove_column :job_opportunities, :employer_id, :integer
  end
end
