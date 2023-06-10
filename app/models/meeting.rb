class Meeting < ApplicationRecord
  belongs_to :video
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
