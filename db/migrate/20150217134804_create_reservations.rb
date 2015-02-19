class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :table_number
      t.datetime :reserv_start
      t.datetime :reserv_end

      t.timestamps
    end
  end
end
