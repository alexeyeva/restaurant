class DeleteStartAndEndFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :reserv_start
    remove_column :reservations, :reserv_end
  end
end
