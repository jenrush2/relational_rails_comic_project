require 'rails_helper'

RSpec.describe Store, type: :model do
    it {should have_many :books}

    describe 'class methods' do
        before(:each) do

            @store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
            @store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
            @store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
            @store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
            @store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)
        
        end
        
        describe '#sort_by_most_recent' do
            it 'sorts by most recent' do

                expect(Store.sort_by_most_recent).to eq([@store_5, @store_4, @store_3, @store_2, @store_1])

            end
        end

    end

end