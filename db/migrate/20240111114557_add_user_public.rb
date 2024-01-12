class AddUserPublic < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :public, :boolean
  end
end
