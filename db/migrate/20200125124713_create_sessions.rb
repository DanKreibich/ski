class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.datetime :start
      t.datetime :end
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
