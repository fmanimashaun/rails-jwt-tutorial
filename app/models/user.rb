class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :recoverable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_many :reservations

  enum role: { user: 0, admin: 1 }

  after_initialize :set_default_role, if: :new_record?

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  roles.keys.each do |role_name|
    define_method("#{role_name}?") do
      role == role_name
    end
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
