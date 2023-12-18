class Public::BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @customer = current_customer
    #@room = .find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    # 予約の保存ロジックをここに記述
    if @booking.save
      # 保存に成功した場合の処理（例: 予約完了ページへリダイレクト）
    else
      # 保存に失敗した場合の処理（例: エラーメッセージを表示）
    end
  end

  def index
    @bookings = current_customer.bookings.page(params[:page])
  end

  def show
    @booking = Booking.find(params[:id])
  end


  private

  def booking_params
    # 必要なパラメータを設定
    params.require(:booking).permit(:customer_id, :check_in, :check_out, :total_place, :payment_method, :payment_day, :booking_status, :paymentstatus)
  end
end
