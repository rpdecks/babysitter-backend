class CreateJobOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :job_opportunities do |t|
      t.references :job, null: false, foreign_key: true
      t.integer :employer_id
      t.integer :caregiver_id

      t.timestamps
    end
  end
end
