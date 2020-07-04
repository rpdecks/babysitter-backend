class DeleteJobCountFromCaregverTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :caregivers, :job_count, :string
  end
end
