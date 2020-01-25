class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :string
    add_column :users, :description, :text
    add_column :users, :min_booking_hours, :integer
    add_column :users, :level, :integer
    add_column :users, :hourly_rate, :integer
    add_column :users, :day_rate, :integer
    add_column :users, :resort, :string
    add_column :users, :avatar, :string
    add_column :users, :max_num_students, :integer
    add_column :users, :birth_date, :date
    add_column :users, :role, :integer
  end
end
