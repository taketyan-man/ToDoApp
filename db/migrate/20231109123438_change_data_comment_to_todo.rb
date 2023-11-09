class ChangeDataCommentToTodo < ActiveRecord::Migration[7.0]
  def change
    change_column :to_dos, :comment, :integer
  end
end
