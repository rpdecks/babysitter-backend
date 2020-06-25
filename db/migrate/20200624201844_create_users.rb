class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :username
      t.string :email
      t.string :phone
      t.date :dob
      t.boolean :smoker
      t.boolean :first_aid_cert
      t.text :bio
      t.float :pay_rate
      t.string :address
      t.boolean :has_pets

      t.timestamps
    end
  end
end
