class ChangeJobsCaregiverIdFromReferencesToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :caregiver_id, :integer
  end
end
