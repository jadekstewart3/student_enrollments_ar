require 'rails_helper'

RSpec.describe "Student show page" do 
  describe "As a visitor" do 
    before :each do 
      @phil = Student.create!(name: "Philip DeFraties")
      @sean = Student.create!(name: "Sean Morris")
      @ms_ruby = Teacher.create!(name: "Miss Ruby", room_number: 9)
      @ms_conlisk = Teacher.create!(name: "Miss Conlisk", room_number: 3)
      art = Course.create!(name: "Art", teacher: @ms_conlisk)
      math = Course.create!(name: "Math", teacher: @ms_ruby)
      geography = Course.create!(name: "Geography", teacher: @ms_ruby)
      Enrollment.create!(student: @phil, course: math, grade: 90)
      Enrollment.create!(student: @phil, course: art, grade: 95)
      Enrollment.create!(student:@sean , course: geography, grade: 80)
      visit student_path(@phil)
    end

    describe "When I visity the students show page" do 

      it "displays the name of the student" do 
        expect(page).to have_content("Philip DeFraties")
        expect(page).to_not have_content("Sean Morris")
      end

      it "displays a list of courses that the student is enrolled in" do 
        expect(page).to have_content("Art")
        expect(page).to have_content("Math")
        expect(page).to_not have_content("Geography")
      end

      it "displays the students grade point average" do 
        expect(page).to have_content("92.5")
      end

      it "displays all of the teachers this student has based on class enrollment" do 
        expect(page).to have_content("Teachers: Miss Conlisk Miss Ruby")
      end
    end
  end
end