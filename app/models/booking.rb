class Booking < ApplicationRecord
  belongs_to :customer
  has_many :booking_details
end
