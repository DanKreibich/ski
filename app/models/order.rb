class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :instructor, class_name: 'User'
  belongs_to :student, class_name: 'User'
end
