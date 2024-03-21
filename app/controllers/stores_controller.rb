class StoresController < ApplicationController
    def index
        @stores_most_recent = Store.sort_by_most_recent
    end

    def show
        @store = Store.find(params[:id])
    end

end