require 'rails_helper'

RSpec.describe Car, type: :model do
  # Test associations
  it 'has many reservations' do
    expect(Car.reflect_on_association(:reservations).macro).to eq(:has_many)
  end

  it 'has one car detail' do
    expect(Car.reflect_on_association(:car_detail).macro).to eq(:has_one)
  end

  it 'has one attached car image' do
    car = create(:car)
    expect(car.car_image).to be_attached
  end

  # Test validations
  it 'validates presence of name' do
    car = build(:car, name: nil)
    expect(car).not_to be_valid
    expect(car.errors[:name]).to include("can't be blank")
  end

  it 'validates length of name' do
    car = build(:car, name: 'a' * 256)
    expect(car).not_to be_valid
    expect(car.errors[:name]).to include('is too long (maximum is 255 characters)')
  end

  it 'validates presence of description' do
    car = build(:car, description: nil)
    expect(car).not_to be_valid
    expect(car.errors[:description]).to include("can't be blank")
  end

  it 'validates length of description' do
    car = build(:car, description: 'a' * 256)
    expect(car).not_to be_valid
    expect(car.errors[:description]).to include('is too long (maximum is 255 characters)')
  end

  it 'validates presence of car detail' do
    car = build(:car, car_detail: nil)
    expect(car).not_to be_valid
    expect(car.errors[:car_detail]).to include("can't be blank")
  end

  it 'validates attachment of car image' do
    car = build(:car)
    car.car_image.detach
    expect(car).not_to be_valid
    expect(car.errors[:car_image]).to include('must be attached')
  end

  # Test callbacks
  describe '#update_image_url' do
    let(:car) { create(:car) }

    it 'updates the image_url attribute after attaching the car_image' do
      expect(car.image_url).to be_present
      expect(car.image_url).to eq(Rails.application.routes.url_helpers.url_for(car.car_image))
    end
  end
end
