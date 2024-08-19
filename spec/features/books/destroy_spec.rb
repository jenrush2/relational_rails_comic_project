require 'rails_helper'

RSpec.describe 'Delete Book' do
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

    it 'can delete a book from the book show page' do
        visit '/books'

        expect(page).to have_content('Distant Thunder')
        
        visit "/books/#{@book_2.id}"

        click_button 'Delete Book'

        expect(current_path).to eq('/books')

        expect(page).not_to have_content('Distant Thunder')

    end
end