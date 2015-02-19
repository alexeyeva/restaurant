class Reservation < ActiveRecord::Base
  
  validates_presence_of :table_number, :start_time, :end_time
  validates_with TableValidator, on: :create
  validates_with TableValidator, on: :update
  
end

