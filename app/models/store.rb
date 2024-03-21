class Store < ApplicationRecord
    has_many :books

    def self.sort_by_most_recent
        self.order(updated_at: :desc)
    end

end