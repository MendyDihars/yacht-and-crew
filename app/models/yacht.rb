class Yacht < ApplicationRecord
  has_many :bookings
  has_many :users, through: :booking
end
