class ChangeJobStatusDefaultToIncomplete < ActiveRecord::Migration[6.0]
  def change
    change_column_default :jobs, :status, "incomplete"
  end
end
