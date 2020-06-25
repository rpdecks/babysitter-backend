class CreateEmployers < ActiveRecord::Migration[6.0]
  def change
    create_table :employers do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.date :dob
      t.string :gender
      t.string :phone
      t.boolean :smoker
      t.text :bio
      t.boolean :has_pets
      t.integer :job_count

      t.timestamps
    end
  end
end
