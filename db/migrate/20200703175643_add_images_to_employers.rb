class AddImagesToEmployers < ActiveRecord::Migration[6.0]
  def change
    add_column :employers, :image, :string
  end
end
