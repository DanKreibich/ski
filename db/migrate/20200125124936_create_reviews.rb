class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :instructor
      t.references :student
      t.text :description
      t.integer :rating

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :instructor_id, primary_key: :id
    add_foreign_key :reviews, :users, column: :student_id, primary_key: :id
  end
end
