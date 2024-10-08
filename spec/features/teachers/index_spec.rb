require "rails_helper"

RSpec.describe "Teachers Index" do 
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
      visit teachers_path
    end

    describe "When I visit the teachers index" do 
      it "displays a list of all of the teachers" do 
        expect(page).to have_content("Miss Ruby")
        expect(page).to have_content("Miss Conlisk")
      end

      it "shows the names of all of the students that teacher has" do 
        expect(page).to have_content("Miss Ruby\nRoom Number:9\nStudents: Philip DeFraties Sean Morris\nMiss Conlisk\nRoom Number:3\nStudents: Philip DeFraties")
      end

      it "displays each students name as a link to that students show page" do
        expect(page).to have_link("Sean Morris")

        click_link "Sean Morris"

        expect(current_path).to eq(student_path(@sean))
      end
    end
  end
end