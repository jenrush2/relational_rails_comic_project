require 'rails_helper'




RSpec.describe "store index page", type: :feature do
    before(:each) do

        @store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
        @store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        @store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        @store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        @store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)

        @book_1 = @store_1.books.create!(name: "In the Beginning", series: "Dark Knights of Steel", volume: 1, on_display: false)
        @book_2 = @store_1.books.create!(name: "Distant Thunder", series: "Dark Knights of Steel", volume: 2, on_display: false)
        @book_3 = @store_4.books.create!(name: "The Long Way Home: Part I", series: "Buffy: Season 8", volume: 1, on_display: true)
        @book_4 = @store_4.books.create!(name: "The Long Way Home: Part II", series: "Buffy: Season 8", volume: 2, on_display: true)
        @book_5 = @store_2.books.create!(name: "The Long Way Home: Part III", series: "Buffy: Season 8", volume: 3, on_display: false)
        @book_6 = @store_2.books.create!(name: "The Long Way Home: Part IV", series: "Buffy: Season 8", volume: 4, on_display: true)
        @book_7 = @store_3.books.create!(name: "The Gathering Storm", series: "Dark Knights of Steel", volume: 3, on_display: true)
        @book_8 = @store_4.books.create!(name: "The Chain", series: "Buffy: Season 8", volume: 5, on_display: false)
        @book_9 = @store_4.books.create!(name: "Another Book", series: "Buffy: Season 8", volume: 6, on_display: true)
        
    
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

    it 'has a button next to each store to edit' do
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


#Extension 1: Sort Parents by Number of Children 
# As a visitor
# When I visit the Parents Index Page
# Then I see a link to sort parents by the number of `child_table_name` they have
# When I click on the link
# I'm taken back to the Parent Index Page where I see all of the parents in order of 
# their count of `child_table_name` (highest to lowest) And, I see the number of 
# children next to each parent name
    it 'has a link to sort parents by number of books' do
        visit "/stores"
      
        expect(page).to have_link('Sort Stores by Number of Books', href: '/stores/by_books')

        click_link(href: '/stores/by_books')

        expect(page).to have_current_path('/stores/by_books')

        #test that stores are ordered by number of books, highest to lowest
        expect('Colorado Springs').to appear_before('Aurora')
        expect('Aurora').to appear_before('Denver')
        expect('Denver').to appear_before('Castle Rock')
        expect('Castle Rock').to appear_before('Crested Butte')
        
        #test that you see the number of books next to each store name
        expect(page.first('h3')).to have_content(@store_4.books.length)
        expect(page.first('h3')).not_to have_content(@store_1.books.length)

        #test that there is a link to get back to the normal index page
        click_link(href: '/stores')

        expect(page).to have_current_path('/stores')
    end


end
