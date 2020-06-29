class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.references :job, null: false, foreign_key: true
      t.references :caregiver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
