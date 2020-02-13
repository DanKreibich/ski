class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_many :reviews

  # At the moment "role" validation is creating a error when we sign_up a user
  # validates :role, presence: true
  def count_ratings_average
    review_count = 0
    ratings_total = 0
    self.reviews.each do |review|
      review_count += 1
      ratings_total += review.rating
    end
    ratings_total / review_count.to_f
  end
end
