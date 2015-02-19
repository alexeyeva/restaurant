class ReservationsController < ApplicationController
  
   before_filter :find_reservation, only: [:show, :update, :destroy]
   attr_accessor :reservation, :reservations
 
  def index
    self.reservations = Reservation.all.order('start_time desc') 
  end
  
  def new
  end
  
  def create
    self.reservation = Reservation.new(reservation_params)
    if reservation.table_number.nil? || reservation.start_time.nil? || reservation.end_time.nil?
      flash[:error] = "Fields can't be empty"
      render :new
    else
      if reservation.valid?
        reservation.save
        redirect_to reservation_path(reservation)
      else
        flash[:error] = "Sorry, this table is reserved"
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
    redirect_to new_reservation_path
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:table_number, :start_time, :end_time)
  end
  
  def find_reservation
    self.reservation = Reservation.find(params[:id])    
  end

end
