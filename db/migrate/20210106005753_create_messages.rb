class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :sender_id
      t.string :content
      t.string :read?

      t.timestamps null: false
    end
  end
end
