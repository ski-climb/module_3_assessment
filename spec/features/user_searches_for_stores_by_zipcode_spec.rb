# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results



require 'rails_helper'

describe "User searches for stores by zipcode" do
  scenario "details for ten stores are displayed", vcr: true do
    visit root_path
    fill_in "search", with: "80202"
    click_on "Search"

    expect(current_path).to eq "/search"
    expect(page).to have_content "16 total stores"
    expect(page).to have_css(".store", count: 10)
    expect(page).to have_content "303-270-9189"
    expect(page).to have_content "Mobile SAS"
    expect(page).to have_content 3.45
  end
end
