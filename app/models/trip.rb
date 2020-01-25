class Trip < ApplicationRecord
  enum status: { pending: 0, accepted: 1, declined: 2 }

  belongs_to :instructor, :class_name => 'User'
  belongs_to :student, :class_name => 'User'

  validates :num_students, presence: true
  # validates :status, default: 0
end
