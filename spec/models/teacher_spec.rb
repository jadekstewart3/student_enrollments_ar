require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe "Relationships" do 
    it { should have_many :courses }
  end
end
