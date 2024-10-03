class Student < ApplicationRecord
  has_many :enrollments
  has_many :courses, through: :enrollments

  def course_count
    courses.count
  end

  def grade_average
    courses.average(:grade)
  end
end
