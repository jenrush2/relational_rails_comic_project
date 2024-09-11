class Book < ApplicationRecord
    belongs_to :store
    validates :name, :series, :volume, presence: true
    validates :on_display, inclusion: [true, false]
    validates :on_display, exclusion: [nil]

    def self.on_display_only
        Book.where(on_display: true)
    end
end