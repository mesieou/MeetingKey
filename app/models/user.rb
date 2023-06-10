class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :meetings, through: :bookings
  has_many :videos, through: :meetings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
