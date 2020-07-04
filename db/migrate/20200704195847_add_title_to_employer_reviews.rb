class AddTitleToEmployerReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :employer_reviews, :title, :string
  end
end
