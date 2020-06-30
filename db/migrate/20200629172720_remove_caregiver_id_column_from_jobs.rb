class RemoveCaregiverIdColumnFromJobs < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :caregiver_id, :references
  end
end
