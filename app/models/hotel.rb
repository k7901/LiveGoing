class Hotel < ApplicationRecord
  has_many :hotel_service_relations
  has_many :services, through: :hotel_service_relations
  has_many :rooms
  belongs_to :venue
  #has_one_attached :image
  has_many_attached :images



  def get_image(width, height)
   unless images.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   images[0].variant(resize_to_limit: [width, height]).processed
  end
end
