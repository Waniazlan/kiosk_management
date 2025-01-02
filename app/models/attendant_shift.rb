class AttendantShift < ApplicationRecord
  belongs_to :user
  belongs_to :kiosk

  validates :checked_in_at, presence: true
end
