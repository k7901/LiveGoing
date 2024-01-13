class Public::HotelsController < ApplicationController
  def index

    respond_to do |format|
      format.html do
      if hotel_search_params.present?
      @search_params = hotel_search_params  #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
      @hotels = Hotel.search(@search_params)  #Reservationモデルのsearchを呼び出し、引数としてparamsを渡している
      end
        @venues = Venue.all
      end
      format.json do
        @venue = Venue.find_by(name: params[:venue_name])
        @hotels = @venue.hotels
      end
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms.all
    @room_prices = {}

  # 各部屋の価格を計算するロジック
    @rooms.each do |room|
      @room_prices[room.id] = room.price
    end
    @comment = Comment.new
  end

  private

  def hotel_search_params
    # 安全に検索パラメータを許可する（必要に応じて）
    params.permit(:venue, :guest, :amount)
  end

end
