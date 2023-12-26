class Public::HotelsController < ApplicationController
  def index
    @search_params = hotel_search_params  #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    @hotels = Hotel.search(@search_params)  #Reservationモデルのsearchを呼び出し、引数としてparamsを渡している。
    @venues = Venue.all

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
    params.require(:search).permit(:venue, :guest, :amount, :star)
  end

end
