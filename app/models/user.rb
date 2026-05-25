class User < ApplicationRecord
  has_one_attached :photo
  has_one :profile, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :owner_bookings, through: :books, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
