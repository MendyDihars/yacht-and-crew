class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht

  validates :guest_number, presence: true
  validates :checkin, presence: true
  validates :checkout, presence: true
end
