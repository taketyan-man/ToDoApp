class CreateToDos < ActiveRecord::Migration[7.0]
  def change
    create_table :to_dos do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.date :limit_date
      
      t.timestamps
    end
  end
end
