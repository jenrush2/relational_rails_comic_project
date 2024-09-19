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
        @book = @store.books.new(book_params)

        if @book.save
            redirect_to "/stores/#{@store.id}/books"
        else
            flash[:notice] = "Book not created: Required information missing."
            render :new
        end
    end

    private
        def book_params
            params.permit(:name, :series, :volume, :on_display)
        end

end