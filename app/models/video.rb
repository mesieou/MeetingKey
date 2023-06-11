class Video < ApplicationRecord
  serialize :actions, JSON
  has_many :meetings
end
