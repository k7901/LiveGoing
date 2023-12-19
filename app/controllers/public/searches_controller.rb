class Public::SearchesController < ApplicationController

  def index
    # 検索ロジックをここに実装
    @hotels = Hotel.search(search_params)

    # 検索パラメータをセッションに保存
    session[:search_params] = search_params
  end

  private

  def search_params
    params.permit(:check_in_date, :check_out_date, :guests_count, :rooms_count)
  end

end
