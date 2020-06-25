class ChangeFirstAidCertToDefaultFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_default :jobs, :completed, false
  end
end
