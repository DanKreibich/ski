class CreateTrips < ActiveRecord::Migration[5.2]
  # Reference the same model twice: https://stackoverflow.com/questions/2057210/ruby-on-rails-reference-the-same-model-twice
  def change
    create_table :trips do |t|
      t.references :instructor
      t.references :student
      t.integer :num_students
      t.integer :status
      t.text :note

      t.timestamps
    end
    add_foreign_key :trips, :users, column: :instructor_id, primary_key: :id
    add_foreign_key :trips, :users, column: :student_id, primary_key: :id
  end
end

