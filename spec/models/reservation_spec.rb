require 'rails_helper'

describe Reservation do
  
  describe ".create" do
    
    context "when valid" do
      let(:reserv) { FactoryGirl.build(:reservation) }
      it { reserv.should be_valid }
    end
    
    context "when invalid" do

      describe "with the same time" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00") }
        let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00") }
        it "shouldn't create" do
          reserv.should be_valid
          reserv.save
          reserv1.should_not be_valid
        end
      end
      
      describe "with the same start_time and end_time" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 15:00:00") }
        it { reserv.should_not be_valid }
      end
      
      describe "with start_time > end_time" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-17 15:00:00", end_time: "15-02-16 15:00:00") }
        it { reserv.should_not be_valid }
      end
      
      describe "with filled data without time" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18", end_time: "15-02-18") }
        it { reserv.should_not be_valid }
      end
      
      describe "with 2 days long reservation" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-16", end_time: "15-02-18") }
        it { reserv.should_not be_valid }
      end
      
    end
  
  end

end
