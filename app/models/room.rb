class Room < ApplicationRecord
  belongs_to :hotel
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :capacity, presence: true
  validates :hotel_id, presence: true
  validates :amount, presence: true
  validates :price, presence: true
  validates :checklist, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
