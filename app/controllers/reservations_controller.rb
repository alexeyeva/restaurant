class ReservationsController < ApplicationController
  
   before_filter :find_reservation, only: [:show, :update, :destroy]
   attr_accessor :reservation, :reservations
 
  def index
    self.reservations = Reservation.all.order('start_time desc') 
  end
  
  def new
    flash.now[:notice] = "Today is: #{Time.now.to_date} (#{Time.now.to_date.strftime('%d %b %Y')})"
  end
  
  def create
    self.reservation = Reservation.new(reservation_params)
    if reservation.table_number.nil? || reservation.start_time.nil? || reservation.end_time.nil?
      flash[:error] = "Fields can't be empty"
      render :new
    else
      if reservation.save
        redirect_to reservation_path(reservation)
      else
        flash[:error] = "Sorry, #{reservation.errors.messages[:base].join(", ")}"
        render :new
      end
    end
  end
  
  def show
  end

  def update
    if reservation.update_attributes(reservation_params)
      flash[:notice] = "Reservation updated"
      redirect_to reservation_path(reservation)
    else
      flash[:notice] = "Unable to update reservation"
      render :edit
    end
  end
  
  def destroy
    reservation.destroy
    flash[:notice] = "Reservation successfully deleted"
    render :index
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:table_number, :start_time, :end_time)
  end
  
  def find_reservation
    self.reservation = Reservation.find(params[:id])    
  end

end
