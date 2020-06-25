class CreateCaregivers < ActiveRecord::Migration[6.0]
  def change
    create_table :caregivers do |t|
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
      t.float :pay_rate
      t.boolean :first_aid_cert

      t.timestamps
    end
  end
end
