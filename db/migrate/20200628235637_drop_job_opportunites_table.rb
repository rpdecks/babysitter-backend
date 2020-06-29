class DropJobOpportunitesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :job_opportunities
  end
end
