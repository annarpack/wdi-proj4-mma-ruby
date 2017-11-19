class CreateFighters < ActiveRecord::Migration[5.1]
  def change
    create_table :fighters do |t|
      t.string :first_name
      t.string :last_name
      t.integer :wins
      t.integer :losses
      t.string :weight_class
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
