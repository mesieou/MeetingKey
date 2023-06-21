class Meeting < ApplicationRecord
  belongs_to :video
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
