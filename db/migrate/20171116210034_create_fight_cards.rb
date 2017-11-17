class CreateFightCards < ActiveRecord::Migration[5.1]
  def change
    create_table :fight_cards do |t|
      t.string :title
      t.string :tagline
      t.datetime :start_time
      t.string :arena
      t.string :image
      t.string :ticket_url

      t.timestamps
    end
  end
end
