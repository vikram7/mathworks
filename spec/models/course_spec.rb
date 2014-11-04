require 'rails_helper'
require 'spec_helper'

describe Course do

  describe 'validations' do
    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:url ) }
    # it { should have_valid(:url).when('http://www.google.com', 'https://www.google.com', 'www.google.com', 'google.com') }
    it { should validate_presence_of(:source) }

  end

  describe 'associations' do
    it { should belong_to(:source) }
  end

  describe ".search" do
    it "should find the term MATLAB in a course" do
      course = FactoryGirl.create(:course)
      expect(Course.search("MATLAB")).to include(course)
    end
  end

end
