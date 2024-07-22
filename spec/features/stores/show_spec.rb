require 'rails_helper'

RSpec.describe "the stores show page" do 
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
        
        expect(page).to have_content("Income Rank: #{@store_2.income_rank}")
    end

    it 'displays the number of books associated with the store' do
        visit "/stores/#{@store_2.id}"

        expect(page).to have_content("Number of books: 1")

        visit "/stores/#{@store_1.id}"
        

        expect(page).to have_content("Number of books: 3")
    end

    it 'has a link at the top of the page to the Store Index' do
        visit "/stores/#{@store_2.id}"

        expect(page).to have_link('Go to Stores', href: '/stores')

        click_link(href: '/stores')

        expect(page).to have_current_path('/stores')
    end

    it 'has a link at the top of the page to the Book Index' do
        visit "/stores/#{@store_1.id}"
      
        expect(page).to have_link('Go to Books', href: '/books')

        click_link(href: '/books')

        expect(page).to have_current_path('/books')
    end

    it "has a link to this store's book page" do
        visit "/stores/#{@store_1.id}"

        expect(page).to have_link("#{@store_1.city} Store Books", href: "/stores/#{@store_1.id}/books")

        click_link("#{@store_1.city} Store Books")

        expect(page).to have_current_path("/stores/#{@store_1.id}/books")

    end

    it "has a link to update a store" do
        visit "/stores/#{@store_1.id}"

        click_button "Update Store"

        expect(current_path).to eq("/stores/#{@store_1.id}/edit")
    end
    



end