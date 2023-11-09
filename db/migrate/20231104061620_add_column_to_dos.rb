class AddColumnToDos < ActiveRecord::Migration[7.0]
  def change
    add_column :to_dos, :done, :boolean
    add_column :to_dos, :fight, :integer 
    add_column :to_dos, :comment, :string
  end
end
