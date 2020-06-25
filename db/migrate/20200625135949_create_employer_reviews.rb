class CreateEmployerReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :employer_reviews do |t|
      t.references :employer, null: false, foreign_key: true
      t.references :caregiver, null: false, foreign_key: true
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
