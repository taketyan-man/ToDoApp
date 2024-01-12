class AddColumnTodoPublic < ActiveRecord::Migration[7.0]
  def change
    add_column :to_dos, :public, :boolean
  end
end
