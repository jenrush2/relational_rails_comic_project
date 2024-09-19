require 'rails_helper'

RSpec.describe 'New Book in a Store' do
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

    it 'has a create book link to new page' do
        visit "/stores/#{@store_3.id}/books"

        click_button 'Add New Book'

        expect(current_path).to eq("/stores/#{@store_3.id}/books/new")
    end

    it 'can create a new book' do
        visit "/stores/#{@store_3.id}/books/new"
        
        fill_in "Name", with: "No More Lonely Knights"
        fill_in "Series", with: "Dark Knights of Steel"
        fill_in "Volume", with: 4
        select "No", :from => 'On display'

        click_button('Create Book')

        expect(current_path).to eq("/stores/#{@store_3.id}/books")
        expect(page).to have_content("No More Lonely Knights")

    end

    it "can not create a new book with missing name" do
        visit "/stores/#{@store_3.id}/books/new"
        
        #fill_in "Name", with: "No More Lonely Knights"
        fill_in "Series", with: "Dark Knights of Steel"
        fill_in "Volume", with: 4
        select "No", :from => 'On display'

        click_button('Create Book')
        
        expect(page).to have_content("Book not created: Required information missing.")
        expect(page).to have_button("Create Book")
    end

    it "can not create a new book with missing series" do
        visit "/stores/#{@store_3.id}/books/new"
        
        fill_in "Name", with: "No More Lonely Knights"
        #fill_in "Series", with: "Dark Knights of Steel"
        fill_in "Volume", with: 4
        select "No", :from => 'On display'

        click_button('Create Book')
        
        expect(page).to have_content("Book not created: Required information missing.")
        expect(page).to have_button("Create Book")
    end

    it "can not create a new book with missing volume" do
        visit "/stores/#{@store_3.id}/books/new"
        
        fill_in "Name", with: "No More Lonely Knights"
        fill_in "Series", with: "Dark Knights of Steel"
        #fill_in "Volume", with: 4
        select "No", :from => 'On display'

        click_button('Create Book')
        
        expect(page).to have_content("Book not created: Required information missing.")
        expect(page).to have_button("Create Book")
    end

end