class Yacht < ApplicationRecord
  has_many    :bookings
  has_many    :users, through: :booking
  belongs_to  :owner, class_name: 'User', foreign_key: 'owner_id'
  has_attachment :photo
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  validates :name, presence: true
  validates :crew, presence: true
  validates :location, presence: true
  validates :max_capacity, presence: true
end
