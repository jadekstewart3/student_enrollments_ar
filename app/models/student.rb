class Student < ApplicationRecord
  has_many :enrollments
  has_many :courses, through: :enrollments

  def course_count
    courses.count
  end

  def grade_average
    courses.average(:grade)
  end

  def student_teachers
    courses.map do |course|
      course.teacher.name
    end
  end
end
