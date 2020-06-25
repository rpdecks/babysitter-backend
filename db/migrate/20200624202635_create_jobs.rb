class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :status
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.text :desc
      t.integer :total_children
      t.integer :infants
      t.integer :toddlers
      t.integer :school_age
      t.boolean :smoking
      t.boolean :completed
      t.boolean :first_aid_cert
      t.integer :caregiver_id
      t.integer :employer_id

      t.timestamps
    end
  end
end
