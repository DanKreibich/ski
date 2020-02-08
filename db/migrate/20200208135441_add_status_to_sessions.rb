class AddStatusToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :status, :integer, default: 0
  end
end
