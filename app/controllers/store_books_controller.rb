class StoreBooksController < ApplicationController
    def index
        @store = Store.find(params[:store_id])
        @books = @store.books
    end

    def new
        @store = Store.find(params[:store_id])
    end

    def create
        @store = Store.find(params[:store_id])
        @store.books.create(book_params)
        redirect_to "/stores/#{@store.id}/books"
    end

    private
        def book_params
            params.permit(:name, :series, :volume, :on_display)
        end

end