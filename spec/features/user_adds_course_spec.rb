require 'rails_helper'

feature "User adds course" do

  scenario 'user successfully adds course' do
    visit root_path
    course = FactoryGirl.build(:course)

    click_on "Add New Course"
    fill_in "Title", with: course.title
    fill_in "Description", with: course.description
    fill_in "URL", with: course.url
    select course.source.name, from: "Source"
    click_on "Add Course"
    expect(page).to have_content("Course added successfully!")
  end

  scenario 'user unsuccessfully attempts to add course' do
    visit root_path
    course = FactoryGirl.build(:course)

    click_on "Add New Course"
    fill_in "URL", with: course.url
    select course.source.name, from: "Source"
    click_on "Add Course"
    expect(page).to have_content("Sorry, you didn't enter enough information!")
  end

end
