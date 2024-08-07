class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :todo, null: false, foreign_key: true
      t.string :text
      
      t.timestamps
    end
  end
end
