require 'rails_helper'

feature "User adds review" do

  scenario 'authenticated user creates review for a show' do
    review = FactoryGirl.build(:review)
    sign_in_as(review.user)
    click_on "See all shows"
    visit show_path(review.show)
    fill_in "Title", with: review.title
    fill_in "Body", with: review.body
    select review.rating, from: "Rating"
    click_on "Add review"
    expect(page).to have_content("Review created successfully")
  end

  scenario 'authenticated user tries creating an invalid review for a show' do
    review = FactoryGirl.build(:review)
    sign_in_as(review.user)
    click_on "See all shows"
    visit show_path(review.show)
    click_on "Add review"
    expect(page).to have_content("You didn't enter enough information.")
  end
end
