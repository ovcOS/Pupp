class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :destroy]

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def puppy_params
    params.require(:booking).permit(:price, :starts_at, :ends_at, :status)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
