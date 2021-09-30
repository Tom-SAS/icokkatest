class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :maps
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :password_confirmation
  end

  validates :nickname, length: { maximum: 6 }
end
