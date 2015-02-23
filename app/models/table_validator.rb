class TableValidator < ActiveModel::Validator
  
  
  def validate(record)
    if record.table_number.nil? || record.start_time.nil? || record.end_time.nil?
      record.errors[:base] << "fields can't be blank"
    else
      if record.start_time >= record.end_time
        record.errors[:base] << "invalid reservation time"
      else
        reserved_table(record)
      end
    end
  end
  
  private

  def reserved_table(record)
    
    reservations = Reservation.where("table_number = ?", record.table_number).all
    if reservations.present?
      reservations.each do |r|
        case
        when record.start_time >= r.start_time && record.start_time <= r.end_time then record.errors[:base] << "this table is reserved"
        when record.end_time <= r.end_time && record.end_time >= r.start_time then record.errors[:base] << "this table is reserved"
        when r.start_time >= record.start_time && r.start_time <= record.end_time then record.errors[:base] << "this table is reserved"
        end
      end
    end
    
  end
  
  
end