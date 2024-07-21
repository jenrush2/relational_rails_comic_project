require 'rails_helper'

RSpec.describe 'New Store' do
    describe 'As a visitor' do
        describe 'When I visit new store by clicking link on index' do
            it 'links to a new page from store index' do
                visit "/stores"

                click_link 'New Store'

                expect(current_path).to eq('/stores/new')
            end

            it 'Can create a new store' do
                visit "/stores/new"
                fill_in 'City', with: 'Salida'
                select "Closed", :from => 'Open'
                fill_in 'income_rank', with: '0'
                click_button('Create Store')

                expect(current_path).to eq('/stores')
                expect(page).to have_content('Salida')
                expect(page).to have_content('0')
            end
        end
    end

end