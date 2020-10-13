class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    EMAILE_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, uniqueness: true, format: { with: EMAILE_VALIDATION }
    PASSWORD_VALIDATION = /\A[a-zA-Z0-9]+\z/
    validates :password, confirmation: true, format: { with: PASSWORD_VALIDATION }
    validates :password_confirmation
    validates :gender
    validates :birthday
  end
  validates :introduce, length: { maximum: 1000 }

  enum gender: { man: 0, woman: 1, other: 2}
end
