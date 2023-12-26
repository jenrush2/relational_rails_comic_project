require 'rails_helper'

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe "store index page", type: :feature do
    it "can see the city of each store" do
        store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
        store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)

        visit "/stores"

        expect(page).to have_content(store_1.city)
        expect(page).to have_content(store_2.city)
        expect(page).to have_content(store_3.city)
        expect(page).to have_content(store_4.city)
        expect(page).to have_content(store_5.city)

    end

end
