class AddCaregiverIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :caregiver_id, :integer
  end
end
