class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.references :user, null: false, foreign_key: true
      t.references :to_do, null: false, foreign_key: true
      t.timestamps
    end
  end
end
