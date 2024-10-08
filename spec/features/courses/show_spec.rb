require "rails_helper"

RSpec.describe "Course show page" do 
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
    visit course_path(@art)
  end

  describe "As a visitor" do 
    describe "When I visit the course show page" do 
      it "displays the course name" do 
        expect(page).to have_content("Art")
      end

      it "displays the course grade average" do 
        expect(page).to have_content("Average Grade:\n85.0")
      end

      it "displays a list of students that are below that average" do 
        expect(page).to have_content("Students below average:\nSean Morris: 75")
        expect(page).to_not have_content('Philip Defraties')
      end
    end
  end
end