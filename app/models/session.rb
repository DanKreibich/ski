class Session < ApplicationRecord
  belongs_to :trip

  validates :start, presence: true
  validates :end, presence: true
end
