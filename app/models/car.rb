class Car < ApplicationRecord
  has_many :reservations

  validates :name, presence: true
  validates :description, presence: true
end
