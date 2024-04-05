class CreateToDos < ActiveRecord::Migration[7.0]
  def change
    create_table :to_dos do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.date :limit_date
      t.boolean :done
      t.integer :fight 
      t.integer :comment
      t.boolean :done
      t.boolean :public
      
      t.timestamps
    end
  end
end
