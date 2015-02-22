class UpdateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :table_number
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
