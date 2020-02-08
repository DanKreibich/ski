class Session < ApplicationRecord
  enum status: { pending: 0, accepted: 1, declined: 2 }
  belongs_to :trip

  validates :start, presence: true
  validates :end, presence: true
end
