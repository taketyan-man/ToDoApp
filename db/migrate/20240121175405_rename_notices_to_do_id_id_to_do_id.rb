class RenameNoticesToDoIdIdToDoId < ActiveRecord::Migration[7.0]
  def change
    rename_column :notices, :to_do_id_id, :to_do_id
  end
end
