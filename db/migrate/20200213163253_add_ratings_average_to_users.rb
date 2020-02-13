class AddRatingsAverageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ratings_average, :float
  end
end
