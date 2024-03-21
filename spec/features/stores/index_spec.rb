require 'rails_helper'

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system


# User Story 6, Parent Index sorted by Most Recently Created 

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

RSpec.describe "store index page", type: :feature do
    before(:each) do

        @store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
        @store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        @store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        @store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        @store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)
    
    end
    
    it "can see the city of each store" do

        visit "/stores"
       
        expect(page).to have_content(@store_1.city)
        expect(page).to have_content(@store_2.city)
        expect(page).to have_content(@store_3.city)
        expect(page).to have_content(@store_4.city)
        expect(page).to have_content(@store_5.city)

    end

    it 'orders the books by most recently created first' do
        
        visit "/stores"

        expect(@store_5.city).to have_sibling(@store_4.city, below: @store_5.city)


    end

    it 'lists when each book record was created next to that record'

end
