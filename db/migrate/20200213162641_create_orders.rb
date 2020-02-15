class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :user_sku
      t.monetize :amount, currency: { present: false }
      t.string :checkout_session_id
      t.references :instructor
      t.references :student

      t.timestamps
    end
    add_foreign_key :orders, :users, column: :instructor_id, primary_key: :id
    add_foreign_key :orders, :users, column: :student_id, primary_key: :id
  end
end
