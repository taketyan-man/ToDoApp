class RenameNoticesSendenrId < ActiveRecord::Migration[7.0]
  def change
    rename_column :notices, :sendenr_id, :sender_id
  end
end
