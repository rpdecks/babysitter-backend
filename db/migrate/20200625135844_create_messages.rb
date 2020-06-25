class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :job, null: false, foreign_key: true
      t.text :content
      t.boolean :read

      t.timestamps
    end
  end
end
