require 'rails_helper'

# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

RSpec.describe 'Store books index', type: :feature do
    before(:each) do
        @store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
        @store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        @store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        @store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        @store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)

        @book_1 = @store_1.books.create!(name: "In the Beginning", series: "Dark Knights of Steel", volume: 1, on_display: false)
        @book_2 = @store_1.books.create!(name: "Distant Thunder", series: "Dark Knights of Steel", volume: 2, on_display: false)
        @book_3 = @store_1.books.create!(name: "The Long Way Home: Part I", series: "Buffy: Season 8", volume: 1, on_display: true)
        @book_4 = @store_2.books.create!(name: "The Long Way Home: Part II", series: "Buffy: Season 8", volume: 2, on_display: true)
        @book_5 = @store_3.books.create!(name: "The Long Way Home: Part III", series: "Buffy: Season 8", volume: 3, on_display: false)
        @book_6 = @store_3.books.create!(name: "The Long Way Home: Part IV", series: "Buffy: Season 8", volume: 4, on_display: true)
        @book_7 = @store_4.books.create!(name: "The Gathering Storm", series: "Dark Knights of Steel", volume: 3, on_display: true)
        @book_8 = @store_5.books.create!(name: "The Chain", series: "Buffy: Season 8", volume: 5, on_display: false)
    end

    it 'has the location of the store' do
        visit "/stores/#{@store_1.id}/books"

        expect(page).to have_content(@store_1.city)
        expect(page).to have_no_content(@store_2.city)
        
    end

    it 'has the name of all books in that store' do
        visit "/stores/#{@store_1.id}/books"

        expect(page).to have_content(@book_1.name)
        expect(page).to have_content(@book_2.name)
        expect(page).to have_content(@book_3.name)

        expect(page).to have_no_content(@book_4.name)
 
    end

    it 'has the series of all books in that store' do
        visit "/stores/#{@store_1.id}/books"

        expect(page).to have_content(@book_1.series)
        expect(page).to have_content(@book_2.series)
        expect(page).to have_content(@book_3.series)

    end

    it 'has the volume of all books in that store' do
        visit "/stores/#{@store_1.id}/books"

        expect(page).to have_content(@book_1.volume)
        expect(page).to have_content(@book_2.volume)
        expect(page).to have_content(@book_3.volume)

    end

    it 'has the on_display status of all books in that store' do
        visit "/stores/#{@store_1.id}/books"
        
        expect(page).to have_content(@book_1.on_display)
        expect(page).to have_content(@book_2.on_display)
        expect(page).to have_content(@book_3.on_display)

    end

end