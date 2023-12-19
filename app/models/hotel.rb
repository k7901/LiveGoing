class Hotel < ApplicationRecord
  has_many :hotel_service_relations
  has_many :services, through: :hotel_service_relations
  has_many :rooms
  belongs_to :venue
  #has_one_attached :image
  has_many_attached :images

  scope :search, -> (search_params) do
    return if search_params.blank?

    venue_like(search_params[:venue])
      .check_in_out_range(search_params[:check_in_date], search_params[:check_out_date])
      .guest(search_params[:guest])
      .amount(search_params[:amount])
  end

  scope :venue_like, -> (venue_name) { joins(:venue).where('venues.name LIKE ?', "%#{venue_name}%") if venue_name.present? }
  scope :check_in_out_range, -> (check_in_date, check_out_date) {
    where('check_in_date <= ? AND check_out_date >= ?', check_in_date, check_out_date) if check_in_date.present? && check_out_date.present?
  }
  scope :guest, -> (guest) { joins(:rooms).where('rooms.capacity >= ?', guest) if guest.present? }
  scope :amount, -> (amount) { joins(:rooms).where('rooms.capacity >= ?', amount) if amount.present? }



  #def self.search(search_params)
    #hotels = Hotel.all
    #if search_params[:venue].present?
     # hotels = hotels.joins(:venue).where("venues.name LIKE ?", "%#{search_params[:venue]}%")
    #end
    #hotels
  #end


  def get_image(width, height)
   unless images.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   images[0].variant(resize_to_limit: [width, height]).processed
  end
end
