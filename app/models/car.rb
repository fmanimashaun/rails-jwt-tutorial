class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one :car_detail, dependent: :destroy
  has_one_attached :car_image

  accepts_nested_attributes_for :car_detail

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :description, presence: true, length: { minimum: 10, maximum: 255 }
  validate :car_image_attached

  after_save :update_image_url, if: -> { car_image.attached? }

  private

  def update_image_url
    image_path = Rails.application.routes.url_helpers.rails_blob_path(car_image, only_path: true)
    update_column(:image_url, image_path)
  end

  def car_image_attached
    errors.add(:car_image, 'must be attached') unless car_image.attached?
  end
end
