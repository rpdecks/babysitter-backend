class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :caregiver, null: false, foreign_key: true
      t.references :employer, null: false, foreign_key: true
      t.string :status
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.text :desc
      t.integer :total_child_count
      t.integer :infant_count
      t.integer :toddler_count
      t.integer :school_age_count
      t.boolean :completed
      t.float :pay_rate
      t.boolean :smoker
      t.boolean :first_aid_cert

      t.timestamps
    end
  end
end
