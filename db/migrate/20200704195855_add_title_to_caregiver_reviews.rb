class AddTitleToCaregiverReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :caregiver_reviews, :title, :string
  end
end
