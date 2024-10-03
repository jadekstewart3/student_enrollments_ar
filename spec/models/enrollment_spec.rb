require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  describe "Relationships" do 
    it { should belong_to :student }
    it { should belong_to :course }
  end
end
