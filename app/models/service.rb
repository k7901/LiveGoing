class Service < ApplicationRecord
  has_many :hotel_service_relations
  has_many :hotels, through: :hotel_service_relations
  
  validates :name, presence: true

end
