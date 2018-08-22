class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :destroy]
  before_action :find_puppy


  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    starts_at = Time.new(
      puppy_params['starts_at(1i)'],
      puppy_params['starts_at(2i)'],
      puppy_params['starts_at(3i)'],
      puppy_params['starts_at(4i)'],
      puppy_params['starts_at(5i)'],
      0
    )

    ends_at = Time.new(
      puppy_params['ends_at(1i)'],
      puppy_params['ends_at(2i)'],
      puppy_params['ends_at(3i)'],
      puppy_params['ends_at(4i)'],
      puppy_params['ends_at(5i)'],
      0
    )

    @booking = Booking.create(
      price: 0,
      starts_at: starts_at,
      ends_at: ends_at,
      status: Booking::ACCEPTED,
      puppy_id: @puppy.id,
      user_id: current_user.id
    )

    redirect_to profile_path(current_user)
  end

  def destroy
    @booking.destroy
  end

  private

  def puppy_params
    params.require(:booking).permit(:price, 'starts_at(1i)', 'starts_at(2i)',
  'starts_at(3i)', 'starts_at(4i)', 'starts_at(5i)', 'ends_at(1i)',
  'ends_at(2i)', 'ends_at(3i)', 'ends_at(4i)', 'ends_at(5i)')
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_puppy
    @puppy = Puppy.find(params[:puppy_id])
  end

end

