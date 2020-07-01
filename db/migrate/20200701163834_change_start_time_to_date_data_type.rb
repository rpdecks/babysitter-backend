class ChangeStartTimeToDateDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :start_time, :time
  end
end
