class Store < ApplicationRecord
    has_many :books, dependent: :destroy

    def self.sort_by_most_recent
        Store.order(created_at: :desc)
    end

    def created_formatted
        created_at.strftime("%m-%d-%Y %l:%M %p")
    end

    def book_count
        books.count
    end

    def self.sort_by_number_of_books
        Store.all.sort{|a,b| b.books.length <=> a.books.length}  
    end

end