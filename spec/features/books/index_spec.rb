require 'rails_helper'
# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)


RSpec.describe 'index page', type: :feature do
    before(:each) do
        @book_1 = Book.create(name: "In the Beginning", series: "Dark Knights of Steel", volume: 1, on_display: false)
        @book_2 = Book.create(name: "Distant Thunder", series: "Dark Knights of Steel", volume: 2, on_display: false)
        @book_3 = Book.create(name: "The Long Way Home: Part I", series: "Buffy: Season 8", volume: 1, on_display: true)
        @book_4 = Book.create(name: "The Long Way Home: Part II", series: "Buffy: Season 8", volume: 2, on_display: true)
        @book_5 = Book.create(name: "The Long Way Home: Part III", series: "Buffy: Season 8", volume: 3, on_display: false)
        @book_6 = Book.create(name: "The Long Way Home: Part IV", series: "Buffy: Season 8", volume: 4, on_display: true)
        @book_7 = Book.create(name: "The Gathering Storm", series: "Dark Knights of Steel", volume: 3, on_display: true)
        @book_8 = Book.create(name: "The Chain", series: "Buffy: Season 8", volume: 5, on_display: false)
    end

    it 'displays the name of the book' do

        visit '/books'

        expect(page).to have_content(@book_1.name)
        expect(page).to have_content(@book_2.name)
        expect(page).to have_content(@book_3.name)
        expect(page).to have_content(@book_4.name)
        expect(page).to have_content(@book_5.name)
        expect(page).to have_content(@book_6.name)
        expect(page).to have_content(@book_7.name)
        expect(page).to have_content(@book_8.name)

    end

    it 'displays the series of the book' do

        visit '/books'

        expect(page).to have_content(@book_1.series)
        expect(page).to have_content(@book_2.series)
        expect(page).to have_content(@book_3.series)
        expect(page).to have_content(@book_4.series)
        expect(page).to have_content(@book_5.series)
        expect(page).to have_content(@book_6.series)
        expect(page).to have_content(@book_7.series)
        expect(page).to have_content(@book_8.series)
        
    end

    it 'displays the volume of the book' do

        visit '/books'

        expect(page).to have_content(@book_1.volume)
        expect(page).to have_content(@book_2.volume)
        expect(page).to have_content(@book_3.volume)
        expect(page).to have_content(@book_4.volume)
        expect(page).to have_content(@book_5.volume)
        expect(page).to have_content(@book_6.volume)
        expect(page).to have_content(@book_7.volume)
        expect(page).to have_content(@book_8.volume)
    end

    it 'displays the on_display status of the book' do

        visit '/books'

        expect(page).to have_content(@book_1.on_display)
        expect(page).to have_content(@book_2.on_display)
        expect(page).to have_content(@book_3.on_display)
        expect(page).to have_content(@book_4.on_display)
        expect(page).to have_content(@book_5.on_display)
        expect(page).to have_content(@book_6.on_display)
        expect(page).to have_content(@book_7.on_display)
        expect(page).to have_content(@book_8.on_display)
    end

end

