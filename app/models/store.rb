class Store < ApplicationRecord
    has_many :books

    def self.sort_by_most_recent
        self.order(created_at: :desc)
    end

    def created_formatted
        created_at.strftime("%m-%d-%Y %l:%M %p")
    end

    def book_count
        books.count
    end

end