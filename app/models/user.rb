class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  monetize :hourly_rate_cents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_many :reviews
  has_many :orders

  # At the moment "role" validation is creating a error when we sign_up a user
  # validates :role, presence: true
end
