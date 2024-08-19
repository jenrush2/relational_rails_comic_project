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

    def edit
        @store = Store.find(params[:store_id])
    end

    def update
        store = Store.find(params[:store_id])
        store.update(store_params)
        redirect_to "/stores/#{store.id}"
    end

    def destroy
        store = Store.find(params[:store_id])
        store.destroy
        redirect_to '/stores'
    end

    private
        def store_params
            params.permit(:city, :open, :income_rank)
        end

end