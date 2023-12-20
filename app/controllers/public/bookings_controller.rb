class Public::BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @customer = current_customer
    #@room = .find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to complete_bookings_path
    else
      logger.debug @booking.errors.full_messages
      render :check
      # 保存に失敗した場合の処理（例: エラーメッセージを表示）
    end
  end


  def check
    @booking = Booking.new(booking_params)
    @room = @booking.room
    @hotel = @room.hotel
  end

  def complete

  end

  def index
    @bookings = current_customer.bookings.page(params[:page])
  end

  def show
    #@booking = Booking.find(params[:id])
  end


  private

  def booking_params
    # 必要なパラメータを設定
    params.require(:booking).permit(:customer_id, :room_id, :guest, :amount, :check_in_date, :check_out_date, :price, :booking_status, :paymentstatus, :last_name, :first_name, :telephone_number, :email)
  end
end
