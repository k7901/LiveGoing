class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :bookings
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :address, presence: true
  validates :birthday, presence: true
  validates :telephone_number, presence: true

  def customer_params
    # 必要に応じて許可する属性を指定
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
                                     :first_name_kana, :address, :birthday, :telephone_number,
                                     :email, :is_membership_status)
  end
end
