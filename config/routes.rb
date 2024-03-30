Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/stores', to: 'stores#index'
  get '/stores/:id', to: 'stores#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/stores/:store_id/books', to: 'store_books#index'
end
