class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :instructor
  belongs_to :student
end
