class CreateReport < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|

      t.references :comment, null: false, foreign_key: true
      t.references :to_do, null: false, foreign_key: true

      t.timestamps
    end
  end
end
