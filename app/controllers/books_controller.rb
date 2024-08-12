class BooksController < ApplicationController
    def index
        @books_on_display = Book.on_display_only
    end

    def fullindex
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:book_id])
        @store = @book.store
    end

    def update
        book = Book.find(params[:book_id])
        book.update(book_params)
        redirect_to "/books/#{book.id}"
    end

    private
        def book_params
            params.permit(:name, :series, :volume, :on_display)
        end
    
end