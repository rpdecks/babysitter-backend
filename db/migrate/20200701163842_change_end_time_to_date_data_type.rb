class ChangeEndTimeToDateDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :end_time, :time
  end
end
