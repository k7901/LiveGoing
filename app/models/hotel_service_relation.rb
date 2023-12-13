class HotelServiceRelation < ApplicationRecord
  belongs_to :hotel
  belongs_to :service
end
