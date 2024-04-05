class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.references :receivor, foreign_key: { to_table: :users }, null: false
      t.references :sender, foreign_key: { to_table: :users }, null: false
      t.integer :action
      t.integer :action_id
      t.boolean :checked
      t.reference :notices, :to_do, null: false, fpreign_key: true
      
      t.timestamps
    end
  end
end
