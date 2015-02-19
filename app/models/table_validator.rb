class TableValidator < ActiveModel::Validator
  
  def validate(record)
    if record.start_time >= record.end_time || record.end_time.to_date >= (record.start_time.to_date + 1)
      record.errors[:base] << "invalid reservation time"
    else
      if r = Reservation.find_by_table_number(record.table_number)
        if record.start_time >= r.start_time && record.start_time <= r.end_time
          record.errors[:base] << "this table is reserved"
        elsif record.end_time <= r.end_time && record.end_time >= r.start_time
          record.errors[:base] << "this table is reserved"
        end
      end
    end
  end
  
end