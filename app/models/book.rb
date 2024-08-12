class Book < ApplicationRecord
    belongs_to :store

    def self.on_display_only
        Book.where(on_display: true)
    end
end