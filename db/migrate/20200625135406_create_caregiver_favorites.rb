class CreateCaregiverFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :caregiver_favorites do |t|
      t.references :caregiver, null: false, foreign_key: true
      t.references :employer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
