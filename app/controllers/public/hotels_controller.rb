class Public::HotelsController < ApplicationController
  def index
   @search_params = hotel_search_params
   @hotels = Hotel.search(@search_params)  #Reservationモデルのsearchを呼び出し、引数としてparamsを渡している。
    #if params[:venue].present? || params[:check_in_date].present? || params[:check_out_date].present? || params[:guest].present?
      # 検索ロジックをここに実装
     # @hotels = Hotel.search(params.slice(:venue, :check_in_date, :check_out_date, :rooms_count, :guests_count))
    #else
      #@hotels = Hotel.all
    #end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms.all

    check_in_date = params[:check_in_date].present? ? Date.parse(params[:check_in_date]) : nil
    check_out_date = params[:check_out_date].present? ? Date.parse(params[:check_out_date]) : nil

    # 宿泊日数を計算
    stay_days = check_in_date && check_out_date ? (check_out_date - check_in_date).to_i : nil

    @room_prices = {}
    if stay_days
      @rooms.each do |room|
        @room_prices[room.id] = room.price * stay_days
      end
    end
  end


  private

  def hotel_search_params
    # 安全に検索パラメータを許可する（必要に応じて）
    params.require(:search).permit(:venue, :check_in_date, :check_out_date, :guest, :amount)
  end

end
