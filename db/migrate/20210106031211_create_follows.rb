class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.string :follower_id
      t.string :following_id

      t.timestamps null: false
    end
  end
end
