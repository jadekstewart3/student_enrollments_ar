require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Relationships" do 
    it { should belong_to :teacher }
    it { should have_many :enrollments }
    it { should have_many(:students).through(:enrollments) }
  end
end
