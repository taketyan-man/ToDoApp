class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.references :receivor_id, foreign_key: { to_table: :users }
      t.references :sendenr_id, foreign_key: { to_table: :users }
      t.integer :action
      t.integer :action_id
      t.boolean :checked
      t.timestamps
    end
  end
end
