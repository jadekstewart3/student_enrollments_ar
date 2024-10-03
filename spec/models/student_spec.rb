require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "Relationships" do 
    it { should have_many :enrollments }
    it { should have_many(:courses).through(:enrollments) }
  end

  before :each do 
    @phil = Student.create!(name: "Philip DeFraties")
    @ms_ruby = Teacher.create!(name: "Miss Ruby", room_number: 9)
    @ms_conlisk = Teacher.create!(name: "Miss Conlist", room_number: 3)
    art = Course.create!(name: "Art", teacher: @ms_conlisk)
    math = Course.create!(name: "Math", teacher: @ms_ruby)
    Enrollment.create!(student: @phil, course: math, grade: 90)
    Enrollment.create!(student: @phil, course: art, grade: 95)
  end

  describe "#course_count" do 
    it "returns the number of courses a student is enrolled in" do 
      expect(@phil.course_count).to eq(2)
    end
  end

  describe "#grade_average" do 
    it "returns the number of courses a student is enrolled in" do 
      expect(@phil.grade_average).to eq(92.5)
    end
  end
end
