class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :conversation_id

      t.timestamps
    end
  end
end
