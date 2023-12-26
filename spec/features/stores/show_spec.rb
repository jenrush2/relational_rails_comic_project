require 'rails_helper'

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

RSpec.describe "the stores show page" do 
    before(:each) do
        @store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
        @store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        @store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        @store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        @store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)
    end

    it 'displays the store city' do
        visit "/stores/#{@store_2.id}"

        expect(page).to have_content(@store_2.city)

    end

    it 'displays the store open status' do
        visit "/stores/#{@store_2.id}"

        expect(page).to have_content("Open: #{@store_2.open}")
    end

    it 'displays the store income rank' do
        visit "/stores/#{@store_2.id}"
        save_and_open_page
        expect(page).to have_content("Income Rank: #{@store_2.income_rank}")
    end


end