class CreateEmployerFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :employer_favorites do |t|
      t.references :employer, null: false, foreign_key: true
      t.references :caregiver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
