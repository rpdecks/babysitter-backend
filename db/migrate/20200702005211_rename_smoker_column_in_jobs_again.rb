class RenameSmokerColumnInJobsAgain < ActiveRecord::Migration[6.0]
  def change
    rename_column :jobs, :non_smoking?, :non_smoking
  end
end
