class RemoveHourlyRateFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :hourly_rate, :integer
  end
end
