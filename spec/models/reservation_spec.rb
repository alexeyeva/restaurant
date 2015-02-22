require 'rails_helper'

describe Reservation do
  
  describe ".create" do
    
    context "when valid" do
      let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00") }
      let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 17:00:00", end_time: "15-02-18 18:00:00") }
      it "should create" do
        reserv.should be_valid
        reserv.save
        reserv1.should be_valid
      end
    end
    
    context "when invalid" do

      describe "with the same reservation time" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00") }
        let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00") }
        it "shouldn't create" do
          reserv.should be_valid
          reserv.save
          reserv1.should_not be_valid
        end
      end
      
      describe "when new reservation during old one" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 17:00:00") }
        let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 16:00:00", end_time: "15-02-18 16:55:00") }
        it "shouldn't create" do
          reserv.should be_valid
          reserv.save
          reserv1.should_not be_valid
        end
      end
      
      describe "when new reservation starts before and ends during old one" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-17 15:00:00", end_time: "15-02-17 16:00:00") }
        let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-17 14:00:00", end_time: "15-02-17 15:30:00") }
        it "shouldn't create" do
          reserv.should be_valid
          reserv.save
          reserv1.should_not be_valid
        end
      end
      
      describe "when new reservation starts during old one" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-17 15:00:00", end_time: "15-02-17 16:00:00") }
        let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-17 15:30:00", end_time: "15-02-17 16:30:00") }
        it "shouldn't create" do
          reserv.should be_valid
          reserv.save
          reserv1.should_not be_valid
        end
      end
      
      describe "when new reservation ends during old one" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-17 15:00:00", end_time: "15-02-17 16:00:00") }
        let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-17 14:30:00", end_time: "15-02-17 15:30:00") }
        it "shouldn't create" do
          reserv.should be_valid
          reserv.save
          reserv1.should_not be_valid
        end
      end
      
      describe "when old reservation during new one" do
        let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00") }
        let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 14:00:00", end_time: "15-02-18 17:00:00") }
        it "shouldn't create" do
          reserv.should be_valid
          reserv.save
          reserv1.should_not be_valid
        end
      end
      
    end
  
  end

  describe ".update" do
    
    context "when valid" do
      let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00") }
      let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 16:30:00", end_time: "15-02-18 16:55:00") }
      let(:update) { {table_number: 2, start_time: "15-02-19 17:00:00", end_time: "15-02-19 18:00:00"} }
      it "should update" do
        reserv.should be_valid
        reserv.save!
        reserv.reload
        reserv1.should be_valid
        reserv1.save!
        reserv1.reload
        reserv.update_attributes!(update)
      end
    end
    
    context "when invalid" do
      let(:reserv) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 15:00:00", end_time: "15-02-18 16:00:00") }
      let(:reserv1) { FactoryGirl.build(:reservation, table_number: 2, start_time: "15-02-18 16:30:00", end_time: "15-02-18 16:55:00") }
      let(:update) { {table_number: 2, start_time: "15-02-18 16:00:00", end_time: "15-02-18 18:00:00"} }
      it "shouldn't update" do
        reserv.should be_valid
        reserv.save!
        reserv.reload
        reserv1.should be_valid
        reserv1.save!
        reserv1.reload
        reserv.update_attributes(update)
        reserv.should_not be_valid
      end
    end
      
  end
  
end
