class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :instructors, :class_name => 'Trip', :foreign_key => 'instructor_id'
  has_many :students, :class_name => 'Trip', :foreign_key => 'student_id'

  has_many :instructors, :class_name => 'Review', :foreign_key => 'instructor_id'
  has_many :students, :class_name => 'Review', :foreign_key => 'student_id'
end
