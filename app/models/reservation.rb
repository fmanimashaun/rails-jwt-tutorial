class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :city

  validates :date, presence: true

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    return unless date.present? && date < Date.today

    errors.add(:date, "can't be in the past")
  end
end
