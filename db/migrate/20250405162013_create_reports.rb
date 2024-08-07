class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      
      t.references :comment, null: false, foreign_key: true
      t.references :todo, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
