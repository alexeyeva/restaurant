require File.dirname(__FILE__) + '/../test_helper'

class ReservationTest < ActiveSupport::TestCase
  test "creates valid reservation" do
    reserv = FactoryGirl.build(:reservation)
    assert reserv.save
  end
  test "doesn't let to reserve tables at the same time" do
    reserv = FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00")
    assert reserv.save
    reserv1 = FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00")
    assert_not reserv1.save
  end
end