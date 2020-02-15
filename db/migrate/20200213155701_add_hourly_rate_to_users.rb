class AddHourlyRateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_monetize :users, :hourly_rate, currency: { present: false }
  end
end
