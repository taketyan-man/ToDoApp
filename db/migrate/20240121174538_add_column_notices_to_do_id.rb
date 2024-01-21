class AddColumnNoticesToDoId < ActiveRecord::Migration[7.0]
  def change
    add_reference :notices, :to_do_id, null: false, fpreign_key: true
  end
end
