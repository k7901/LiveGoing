class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true


  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "guest"
      user.first_name = "user"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  def user_params
    # 必要に応じて許可する属性を指定
    params.require(:user).permit(:last_name, :first_name,:email, :is_active)
  end
end
