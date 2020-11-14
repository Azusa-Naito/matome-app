class Classroom < ApplicationRecord
  has_many :classroom_teachers
  has_many :classroom_students
  has_many :teachers, through: :classroom_teachers
  has_many :students, through: :classroom_students
end
