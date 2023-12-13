class Venue < ApplicationRecord
   belongs_to :prefecture
   has_many :hotels
end
