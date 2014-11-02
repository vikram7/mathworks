require 'rails_helper'

feature "User searches for a course" do

  scenario 'user searches for course' do
    visit root_path
    course = FactoryGirl.create(:course)
    fill_in "search", with: course.title
    click_on "Search"
    expect(page).to have_content(course.title)
  end

  scenario 'user leaves search field empty' do
    visit root_path
    course1 = FactoryGirl.create(:course)
    course2 = FactoryGirl.create(:course, title: "Simulink", url: "http://www.mathworks.com/products/simulink/")
    click_on "Search"
    expect(page).to have_content(course1.title)
    expect(page).to have_content(course2.title)
  end

end
