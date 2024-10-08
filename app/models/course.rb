class Course < ApplicationRecord
  belongs_to :teacher
  has_many :enrollments
  has_many :students, through: :enrollments

  def course_grade_average
    enrollments.average(:grade)
  end

  def students_below_average
    avg_grade = course_grade_average
    return [] unless avg_grade 

    enrollments
      .includes(:student) 
      .where('enrollments.grade < ?', avg_grade)
      .map { |enrollment| { student: enrollment.student, grade: enrollment.grade } }
  end

end
