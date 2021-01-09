class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :morning_routine
      t.string :evening_routine
      t.string :bio
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
