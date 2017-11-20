class CreateFighters < ActiveRecord::Migration[5.1]
  def change
    create_table :fighters do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.string :weight_class
      t.string :status
      t.boolean :title_holder
      t.string :image
      t.string :belt_thumbnail
      t.integer :user_id

      t.timestamps
    end
  end
end
