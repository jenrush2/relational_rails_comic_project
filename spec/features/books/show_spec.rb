require 'rails_helper'

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

RSpec.describe 'books show page', type: :feature do
    before(:each) do
        @book_1 = Book.create(name: "In the Beginning", series: "Dark Knights of Steel", volume: 1, on_display: false)
        @book_2 = Book.create(name: "Distant Thunder", series: "Dark Knights of Steel", volume: 2, on_display: true)
    end

    it 'shows the book name with that id' do
        visit "/books/#{@book_2.id}"

        expect(page).to have_content(@book_2.name)
        expect(page).to have_no_content(@book_1.name)
    end

    it 'shows the series name' do
        visit "/books/#{@book_2.id}"

        expect(page).to have_content(@book_2.series)
    end

    it 'shows the volume' do
        visit "/books/#{@book_2.id}"

        expect(page).to have_content(@book_2.volume)
        expect(page).to have_no_content(@book_1.volume)
    end

    it 'shows the on_display status' do
        visit "/books/#{@book_2.id}"
        
        expect(page).to have_content(@book_2.on_display)
        expect(page).to have_no_content(@book_1.on_display)
    end
end

