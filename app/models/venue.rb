class Venue < ApplicationRecord
   belongs_to :prefecture
   has_many :hotels
   
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
end
