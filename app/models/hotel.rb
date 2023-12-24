class Hotel < ApplicationRecord
  has_many :hotel_service_relations
  has_many :services, through: :hotel_service_relations
  has_many :rooms
  has_many :comments
  belongs_to :venue
  has_many_attached :images


  def self.search(search_params)
    hotels = Hotel.all
    hotels = hotels.joins(:venue).where("venues.name LIKE ?", "%#{search_params[:venue]}%") if search_params[:venue].present?
    # 他の検索条件をここに追加
    hotels
  end

  def get_image(width, height)
   unless images.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   images[0].variant(resize_to_limit: [width, height]).processed
  end
end
