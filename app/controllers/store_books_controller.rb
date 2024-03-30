class StoreBooksController < ApplicationController
    def index
        @store = Store.find(params[:store_id])
        @books = @store.books
    end
end