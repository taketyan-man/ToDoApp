class ChangeColumnNameId < ActiveRecord::Migration[7.0]
  def change
    rename_column :notices, :receivor_id_id, :receivor_id
    rename_column :notices, :sendenr_id_id, :sendenr_id
  end
end
