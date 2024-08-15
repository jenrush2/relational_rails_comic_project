require 'rails_helper'

RSpec.describe 'delete a store' do
    before(:each) do
        @store_1 = Store.create!(city: "Auroa", open: false, income_rank: 2)
        @store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        @store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        @store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        @store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)

        @book_1 = @store_1.books.create!(name: "In the Beginning", series: "Dark Knights of Steel", volume: 1, on_display: false)
        @book_2 = @store_1.books.create!(name: "Distant Thunder", series: "Dark Knights of Steel", volume: 2, on_display: false)
        @book_3 = @store_1.books.create!(name: "The Long Way Home: Part I", series: "Buffy: Season 8", volume: 1, on_display: true)
        @book_4 = @store_2.books.create!(name: "A different book", series: "Buffy: Season 8", volume: 2, on_display: true)
        @book_5 = @store_3.books.create!(name: "The Long Way Home: Part III", series: "Buffy: Season 8", volume: 3, on_display: false)
        @book_6 = @store_3.books.create!(name: "The Long Way Home: Part IV", series: "Buffy: Season 8", volume: 4, on_display: true)
        @book_7 = @store_4.books.create!(name: "The Gathering Storm", series: "Dark Knights of Steel", volume: 3, on_display: true)
        @book_8 = @store_5.books.create!(name: "The Chain", series: "Buffy: Season 8", volume: 5, on_display: false)
    end
    
    it 'can delete a store from the store show page' do
        visit '/stores'

        expect(page).to have_content("Denver")

        visit "/stores/#{@store_2.id}"

        click_button "Delete #{@store_2.city} Store"

        expect(current_path).to eq('/stores')

        expect(page).to_not have_content("Denver")

        visit '/books/all'

        expect(page).to_not have_content('A different book')

    end
end