class AddPasswordDigestToCaregivers < ActiveRecord::Migration[6.0]
  def change
    add_column :employers, :password_digest, :string
  end
end
