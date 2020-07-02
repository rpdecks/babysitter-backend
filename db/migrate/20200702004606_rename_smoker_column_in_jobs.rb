class RenameSmokerColumnInJobs < ActiveRecord::Migration[6.0]
  def change
    rename_column :jobs, :smoker, :non_smoking?
  end
end
