require 'rails_helper'

RSpec.describe 'Update Book' do
    before(:each) do
        @store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
        @store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        @store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        @store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        @store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)
    

        @book_1 = @store_1.books.create!(name: "In the Beginning", series: "Dark Knights of Steel", volume: 1, on_display: false)
        @book_2 = @store_1.books.create!(name: "Distant Thunder", series: "Dark Knights of Steel", volume: 2, on_display: true)
        @book_3 = @store_2.books.create!(name: "The Long Way Home: Part I", series: "Buffy: Season 8", volume: 1, on_display: true)
        @book_4 = @store_2.books.create!(name: "The Long Way Home: Part II", series: "Buffy: Season 8", volume: 2, on_display: true)
        @book_5 = @store_2.books.create!(name: "The Long Way Home: Part III", series: "Buffy: Season 8", volume: 3, on_display: false)
        @book_6 = @store_3.books.create!(name: "The Long Way Home: Part IV", series: "Buffy: Season 8", volume: 4, on_display: true)
        @book_7 = @store_4.books.create!(name: "The Gathering Storm", series: "Dark Knights of Steel", volume: 3, on_display: true)
        @book_8 = @store_5.books.create!(name: "The Cain", series: "Buffy: Season 8", volume: 5, on_display: false)
    end

    it 'has a link on book show page to update' do
        visit "/books/#{@book_8.id}"

        expect(page).to have_content("The Cain")

        click_button "Update Book"

        expect(current_path).to eq("/books/#{@book_8.id}/edit")
    end

    it 'can update a book name' do
        visit "/books/#{@book_8.id}/edit"
        
        fill_in 'Name', with: 'The Chain'

        click_button 'Update Book'

        expect(current_path).to eq("/books/#{@book_8.id}")
        expect(page).to have_content('The Chain')
        expect(page).to have_content('Buffy: Season 8')
        expect(page).to have_content('false')
        
    end

    it 'can update a book series' do
        visit "/books/#{@book_8.id}/edit"

        fill_in 'Series', with: 'Pizza'

        click_button 'Update Book'

        expect(current_path).to eq("/books/#{@book_8.id}")
        expect(page).to have_content('Pizza')
    end

    it 'can update a book on display status' do
        visit "/books/#{@book_8.id}/edit"

        select 'Yes', :from => 'on_display'

        click_button 'Update Book'

        expect(current_path).to eq("/books/#{@book_8.id}")
        expect(page).to have_content('true')
    end

    it 'can update a book volume' do
        visit "/books/#{@book_8.id}/edit"

        fill_in 'Volume', with: '13'

        click_button 'Update Book'

        expect(current_path).to eq("/books/#{@book_8.id}")
        expect(page).to have_content('13')
    end

    it 'has a link on the book index page to edit each book' do
        #book 2 test
        visit '/books'

        click_button "Edit #{@book_2.name}"

        expect(current_path).to eq("/books/#{@book_2.id}/edit")

        #book 3 test
        visit '/books'

        click_button "Edit #{@book_3.name}"

        expect(current_path).to eq("/books/#{@book_3.id}/edit")

        #book 7 test
        visit '/books'

        click_button "Edit #{@book_7.name}"

        expect(current_path).to eq("/books/#{@book_7.id}/edit")


    end

    it 'has a link on the store/book index page to edit each book' do
        #store 1
        visit "/stores/#{@store_1.id}/books"
        #book 1
        click_button "Edit #{@book_1.name}"

        expect(current_path).to eq("/books/#{@book_1.id}/edit")

        #store 1
        visit "/stores/#{@store_1.id}/books"
        #book 2
        click_button "Edit #{@book_2.name}"

        expect(current_path).to eq("/books/#{@book_2.id}/edit")

        #store 3
        visit "/stores/#{@store_3.id}/books"
        #book 6
        click_button "Edit #{@book_6.name}"

        expect(current_path).to eq("/books/#{@book_6.id}/edit")
    end


    it 'has a link on the fullindex page to edit each book' do
        #book 7
        visit '/books/all'

        click_button "Edit #{@book_7.name}"

        expect(current_path).to eq("/books/#{@book_7.id}/edit")
        
        #book 8
        visit '/books/all'

        click_button "Edit #{@book_8.name}"

        expect(current_path).to eq("/books/#{@book_8.id}/edit")
    end


end