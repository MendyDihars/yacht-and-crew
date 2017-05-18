class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def create
    @yacht = Yacht.find(params[:yacht_id])
    @booking = @yacht.bookings.new(require_params_book)
    if @booking.save
      @booking.user_id = current_user.id
      @booking.save
      redirect_to user_bookings_path(current_user)
    else
      render 'yachts/show'
    end
  end

  private

  def require_params_book
    params.require(:booking).permit(:guest_number, :checkin, :checkout)
  end
end
