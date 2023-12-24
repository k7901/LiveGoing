class Public::PrefecturesController < ApplicationController

def prefectures_for_region
  region_id = params[:region_id]
  prefectures = Prefecture.where(region_id: region_id)
  render json: prefectures
end

end
