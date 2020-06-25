class CreateCaregiverReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :caregiver_reviews do |t|
      t.references :caregiver, null: false, foreign_key: true
      t.references :employer, null: false, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
