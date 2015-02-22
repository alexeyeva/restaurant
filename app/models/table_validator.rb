class TableValidator < ActiveModel::Validator
  
  def validate(record)
    if record.table_number.nil? || record.start_time.nil? || record.end_time.nil?
      record.errors[:base] << "fields can't be blank"
    else
      if record.start_time >= record.end_time
        record.errors[:base] << "invalid reservation time"
      else
        reservations = Reservation.where("table_number = ?", record.table_number).all
        if reservations.present?
          reservations.each do |r|
            if record.start_time >= r.start_time && record.start_time <= r.end_time
              record.errors[:base] << "this table is reserved"
            elsif record.end_time <= r.end_time && record.end_time >= r.start_time
              record.errors[:base] << "this table is reserved"
            elsif r.start_time >= record.start_time && r.start_time <= record.end_time
              record.errors[:base] << "this table is reserved"
            end
          end
        end
      end
    end
  end
  
  
  
end