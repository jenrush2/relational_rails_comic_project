class Store < ApplicationRecord
    has_many :books

    def self.sort_by_most_recent
        self.order(created_at: :desc)
    end

end