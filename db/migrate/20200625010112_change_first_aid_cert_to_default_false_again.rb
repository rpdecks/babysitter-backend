class ChangeFirstAidCertToDefaultFalseAgain < ActiveRecord::Migration[6.0]
  def change
    change_column_default :jobs, :first_aid_cert, false
  end
end
