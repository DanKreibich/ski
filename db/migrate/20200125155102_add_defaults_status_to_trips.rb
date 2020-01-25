class AddDefaultsStatusToTrips < ActiveRecord::Migration[5.2]
  def change
    change_column_default :trips, :status, 0
  end
end
