class Booking < ApplicationRecord
  belongs_to :customer
  has_many :booking_details

  enum payment_day: { right_now: 0, deadline: 1, on_the_day: 2 }
end
