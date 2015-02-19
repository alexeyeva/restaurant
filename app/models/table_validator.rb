class TableValidator < ActiveModel::Validator
  
  def validate(record)
    if r = Reservation.find_by_table_number(record.table_number)
      if record.start_time >= r.start_time && record.start_time <= r.end_time
        record.errors[:base] << "This table is reserved"
      elsif record.end_time <= r.end_time && record.end_time >= r.start_time
        record.errors[:base] << "This table is reserved"
      end
    end
  end
  
end