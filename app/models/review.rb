class Review < ApplicationRecord
  belongs_to :instructor, :class_name => 'User'
  belongs_to :student, :class_name => 'User'

  validates :description, presence: true, length: { minimum: 50 }
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
