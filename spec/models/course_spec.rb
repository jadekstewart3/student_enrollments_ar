require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Relationships" do 
    it { should belong_to :teacher }
    it { should have_many :enrollments }
    it { should have_many(:students).through(:enrollments) }
  end

  before :each do 
      @phil = Student.create!(name: "Philip DeFraties")
      @sean = Student.create!(name: "Sean Morris")
      @ms_ruby = Teacher.create!(name: "Miss Ruby", room_number: 9)
      @ms_conlisk = Teacher.create!(name: "Miss Conlisk", room_number: 3)
      @art = Course.create!(name: "Art", teacher: @ms_conlisk)
      @math = Course.create!(name: "Math", teacher: @ms_ruby)
      @geography = Course.create!(name: "Geography", teacher: @ms_ruby)
      Enrollment.create!(student: @phil, course: @math, grade: 90)
      Enrollment.create!(student: @phil, course: @art, grade: 95)
      Enrollment.create!(student:@sean , course: @geography, grade: 80)
      Enrollment.create!(student:@sean , course: @math, grade: 85)
      Enrollment.create!(student:@sean , course: @art, grade: 75)
      Enrollment.create!(student:@phil , course: @geography, grade: 80)
    end

  describe "#grade_average" do
    it "resturns the average grade of all students for the course" do
      expect(@math.course_grade_average).to eq(87.5)
    end
  end

  describe "#students_below_average" do 
    it "returns a list of students and their grade taht are below the average" do
       expected_result = [
      { student: @sean, grade: 75 } 
      ]
      expect(@art.students_below_average).to match(expected_result)
    end
  end
end
