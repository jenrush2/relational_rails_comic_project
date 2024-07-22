class StoresController < ApplicationController
    def index
        @stores_most_recent = Store.sort_by_most_recent
    end

    def show
        @store = Store.find(params[:id]) 
    end

    def new
    end

    def create
        Store.create(store_params)
        redirect_to "/stores"
    end

    private
        def store_params
            params.permit(:city, :open, :income_rank)
        end

end