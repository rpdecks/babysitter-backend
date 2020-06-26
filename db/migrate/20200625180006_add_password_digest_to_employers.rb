class AddPasswordDigestToEmployers < ActiveRecord::Migration[6.0]
  def change
    add_column :caregivers, :password_digest, :string
  end
end
