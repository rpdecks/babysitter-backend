class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :favoritor_id
      t.integer :favorited_id

      t.timestamps
    end
  end
end
