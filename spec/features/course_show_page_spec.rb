require 'rails_helper'

feature "User searches for a course" do

  scenario 'user searches for course' do
    course = FactoryGirl.create(:course)
    visit course_path(course.id)
    expect(page).to have_content(course.title)
  end

end
