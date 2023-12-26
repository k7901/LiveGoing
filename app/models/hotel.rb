class Hotel < ApplicationRecord
  has_many :hotel_service_relations
  has_many :services, through: :hotel_service_relations
  has_many :rooms, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :venue, dependent: :destroy
  has_many_attached :images
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :address, presence: true
  validates :venue_id, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :check_in_time_start, presence: true
  validates :check_in_time_end, presence: true
  validates :check_out_time, presence: true
  
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
