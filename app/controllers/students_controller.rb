class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @teachers = @student.student_teachers
  end
end