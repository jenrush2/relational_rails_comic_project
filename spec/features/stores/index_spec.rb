require 'rails_helper'




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

    it 'orders the stores by most recently created first' do

        visit "/stores"
        
        expect(page.first('h2')).to have_content(@store_5.city)
        expect(page.first('h2')).not_to have_content(@store_4.city)
        expect(page.find('h2:last')).to have_content(@store_1.city)
        
        expect('Crested Butte').to appear_before('Colorado Springs')
        expect('Denver').to appear_before('Aurora')
        
    end

    it 'lists when each record was created next to that record' do
        created_time = Time.zone.now

        visit "/stores"

        expect(page).to have_content("Date Created: #{created_time.strftime('%m-%d-%Y')}")
        expect(page).to have_content("Date Created: #{created_time.strftime('%m-%d-%Y%l:%M %p')}")
        
    end

    it 'has a link at the top of the page to the Book Index' do
        visit "/stores"
      
        expect(page).to have_link('Go to Books', href: '/books')

        click_link(href: '/books')

        expect(page).to have_current_path('/books')
    end

    it 'has a link next to each store to edit' do
        #store 1
        visit "/stores"
    
        click_button "Update #{@store_1.city} Store"

        expect(page).to have_current_path("/stores/#{@store_1.id}/edit")

        #store 2
        visit "/stores"

        click_button "Update #{@store_2.city} Store"

        expect(page).to have_current_path("/stores/#{@store_2.id}/edit")

        #store 3
        visit "/stores"
        
        click_button "Update #{@store_3.city} Store"

        expect(page).to have_current_path("/stores/#{@store_3.id}/edit")

        #store 4
        visit "/stores"
        
        click_button "Update #{@store_4.city} Store"

        expect(page).to have_current_path("/stores/#{@store_4.id}/edit")

        #store 5
        visit "/stores"
        
        click_button "Update #{@store_5.city} Store"

        expect(page).to have_current_path("/stores/#{@store_5.id}/edit")
    end

end
