class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @average = @course.course_grade_average
    @students_below_average = @course.students_below_average
  end
end