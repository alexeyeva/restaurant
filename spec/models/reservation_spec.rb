require 'rails_helper'

describe Reservation do
  describe "valid reservation" do
    it "creates" do
      reserv = FactoryGirl.build(:reservation)
      reserv.should be_valid
    end
  end
  describe "invalid reservation" do
    it "doesn't create" do
      reserv = FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00")
      reserv.should be_valid
      reserv.save
      reserv.reload
      reserv1 = FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00")
      reserv1.should_not be_valid
    end
  end
end
