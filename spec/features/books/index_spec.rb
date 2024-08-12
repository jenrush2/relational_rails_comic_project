require 'rails_helper'


RSpec.describe 'index page', type: :feature do
    before(:each) do

        @store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
        @store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        @store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        @store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        @store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)
    

        @book_1 = @store_1.books.create!(name: "In the Beginning", series: "Dark Knights of Steel", volume: 1, on_display: false)
        @book_2 = @store_1.books.create!(name: "Distant Thunder", series: "Dark Knights of Steel", volume: 2, on_display: false)
        @book_3 = @store_2.books.create!(name: "The Long Way Home: Part I", series: "Buffy: Season 8", volume: 1, on_display: true)
        @book_4 = @store_2.books.create!(name: "The Long Way Home: Part II", series: "Buffy: Season 8", volume: 2, on_display: true)
        @book_5 = @store_2.books.create!(name: "The Long Way Home: Part III", series: "Buffy: Season 8", volume: 3, on_display: false)
        @book_6 = @store_3.books.create!(name: "The Long Way Home: Part IV", series: "Buffy: Season 8", volume: 4, on_display: true)
        @book_7 = @store_4.books.create!(name: "The Gathering Storm", series: "Dark Knights of Steel", volume: 3, on_display: true)
        @book_8 = @store_5.books.create!(name: "The Chain", series: "Buffy: Season 8", volume: 5, on_display: false)
    end

    it 'displays the name of the book' do

        visit '/books'
        
        #instructions originally had index page displaying all books
        #then changed to displaying only those that are on display
        #deleted all code in tests for books not on display
        #created a separate test for not having the content of
        #the books not on display
        expect(page).to have_content(@book_3.name)
        expect(page).to have_content(@book_4.name)
        expect(page).to have_content(@book_6.name)
        expect(page).to have_content(@book_7.name)

    end

    it 'displays the series of the book' do

        visit '/books'

        expect(page).to have_content(@book_3.series)
        expect(page).to have_content(@book_4.series)
        expect(page).to have_content(@book_6.series)
        expect(page).to have_content(@book_7.series)
        
    end

    it 'displays the volume of the book' do

        visit '/books'

        expect(page).to have_content(@book_3.volume)
        expect(page).to have_content(@book_4.volume)
        expect(page).to have_content(@book_6.volume)
        expect(page).to have_content(@book_7.volume)
    end

    it 'displays the on_display status of the book' do

        visit '/books'

        expect(page).to have_content(@book_3.on_display)
        expect(page).to have_content(@book_4.on_display)
        expect(page).to have_content(@book_6.on_display)
        expect(page).to have_content(@book_7.on_display)
        
    end

    it 'has a link at the top of the page that takes me to Store Index' do
        visit '/books'
        
        expect(page).to have_link('Go to Stores', href: '/stores')

        click_link(href: '/stores')

        expect(page).to have_current_path('/stores')

    end

    it 'only shows true records on the main index page' do
        visit '/books'

        expect(page).not_to have_content(@book_1.name)
        expect(page).not_to have_content(@book_2.name)
        expect(page).to have_content(@book_3.name)
        expect(page).to have_content(@book_4.name)
        expect(page).not_to have_content(@book_5.name)
        expect(page).to have_content(@book_6.name)
        expect(page).to have_content(@book_7.name)
        expect(page).not_to have_content(@book_8.name) 

    end

    #below is an addition from me and not in the instructions
    #it was weird to only have an index page with on display books
    #so I added a link to a sub index page that still shows all books
    it 'has a link to a show all books page' do
        visit '/books'
        
        expect(page).to have_link('Show All Books', href: '/books/all')

        click_link(href: '/books/all')

        expect(page).to have_current_path('/books/all')
    end


    it 'shows all books on the show all section of the index page' do 
        visit 'books/all'

        #has all names
        expect(page).to have_content(@book_1.name)
        expect(page).to have_content(@book_2.name)
        expect(page).to have_content(@book_3.name)
        expect(page).to have_content(@book_4.name)
        expect(page).to have_content(@book_5.name)
        expect(page).to have_content(@book_6.name)
        expect(page).to have_content(@book_7.name)
        expect(page).to have_content(@book_8.name)

        #has all volumes
        expect(page).to have_content(@book_1.volume)
        expect(page).to have_content(@book_2.volume)
        expect(page).to have_content(@book_3.volume)
        expect(page).to have_content(@book_4.volume)
        expect(page).to have_content(@book_5.volume)
        expect(page).to have_content(@book_6.volume)
        expect(page).to have_content(@book_7.volume)
        expect(page).to have_content(@book_8.volume)

        #has all on_display statuses
        expect(page).to have_content(@book_1.on_display)
        expect(page).to have_content(@book_2.on_display)
        expect(page).to have_content(@book_3.on_display)
        expect(page).to have_content(@book_4.on_display)
        expect(page).to have_content(@book_5.on_display)
        expect(page).to have_content(@book_6.on_display)
        expect(page).to have_content(@book_7.on_display)
        expect(page).to have_content(@book_8.on_display)

        #has all series names
        expect(page).to have_content(@book_1.series)
        expect(page).to have_content(@book_2.series)
        expect(page).to have_content(@book_3.series)
        expect(page).to have_content(@book_4.series)
        expect(page).to have_content(@book_5.series)
        expect(page).to have_content(@book_6.series)
        expect(page).to have_content(@book_7.series)
        expect(page).to have_content(@book_8.series)


    end

    it 'has a link on the show all page to get back to on display only page' do
        visit '/books/all'
        
        expect(page).to have_link('Show Books on Display Only', href: '/books')

        click_link(href: '/books')

        expect(page).to have_current_path('/books')
    end

end

