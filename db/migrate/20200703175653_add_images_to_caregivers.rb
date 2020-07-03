class AddImagesToCaregivers < ActiveRecord::Migration[6.0]
  def change
    add_column :caregivers, :image, :string
  end
end
