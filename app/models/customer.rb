class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :address, presence: true
  validates :birthday, presence: true
  validates :telephone_number, presence: true


  GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.telephone_number = SecureRandom.urlsafe_base64
      customer.address = SecureRandom.urlsafe_base64
      customer.birthday = "1994/01/01"
      customer.last_name = "guest"
      customer.first_name = "user"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  def customer_params
    # 必要に応じて許可する属性を指定
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
                                     :first_name_kana, :address, :birthday, :telephone_number,
                                     :email, :is_membership_status)
  end
end
