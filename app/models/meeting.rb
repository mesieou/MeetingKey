class Meeting < ApplicationRecord
  belongs_to :video, optional: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :start_date_time, presence: true
  validates :end_date_time, presence: true
  validates :title, presence: true
end
