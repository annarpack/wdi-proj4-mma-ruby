class CreateFighterData < ActiveRecord::Migration[5.1]
  def change
    create_table :fighter_data do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.integer :wins
      t.integer :losses
      t.string :weight_class
      t.string :image

      t.timestamps
    end
  end
end
