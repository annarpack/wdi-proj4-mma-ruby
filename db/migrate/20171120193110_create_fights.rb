class CreateFights < ActiveRecord::Migration[5.1]
  def change
    create_table :fights do |t|
      t.string :title
      t.string :tagline
      t.datetime :start_time
      t.string :event_time
      t.string :arena
      t.string :image
      t.string :ticket_url
      t.integer :user_id

      t.timestamps
    end
  end
end
