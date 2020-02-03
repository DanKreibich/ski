class Trip < ApplicationRecord
  enum status: { pending: 0, accepted: 1, declined: 2 }

  belongs_to :instructor, :class_name => 'User'
  belongs_to :student, :class_name => 'User'
  has_many :sessions
  # Extra validation needed for trip creation. See :https://stackoverflow.com/questions/23673513/saving-multiple-records-with-a-single-form-in-rails-4
  accepts_nested_attributes_for :sessions

  validates :num_students, presence: true
end
