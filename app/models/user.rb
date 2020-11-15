class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.nickname = 'サンプル'
      user.birthday = '2000-01-01'
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    EMAILE_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, uniqueness: true, format: { with: EMAILE_VALIDATION }
    PASSWORD_VALIDATION = /\A[a-zA-Z0-9]+\z/.freeze
    validates :password, confirmation: true, format: { with: PASSWORD_VALIDATION }, on: :create
    validates :password_confirmation, on: :create
    validates :gender
    validates :birthday
  end
  validates :introduce, length: { maximum: 1000 }

  enum gender: { 男性: 0, 女性: 1, その他: 2 }

  has_many :posts
  has_many :likes
  has_one_attached :image
end
