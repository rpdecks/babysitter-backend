class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.integer :reviewer_id
      t.integer :reviewed_id

      t.timestamps
    end
  end
end
