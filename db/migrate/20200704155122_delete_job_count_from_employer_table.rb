class DeleteJobCountFromEmployerTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :employers, :job_count, :string
  end
end
