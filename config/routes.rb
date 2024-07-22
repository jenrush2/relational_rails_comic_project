Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/stores', to: 'stores#index'
  # Why can't I put line 8 below line 9? When I do, it thinks new is the store id. Shouldn't it then check the next line instead of throwing an error?
  # Is there a workaround for that? Exact match or something?
  get '/stores/new', to: 'stores#new'
  get '/stores/:id', to: 'stores#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/stores/:store_id/books', to: 'store_books#index'
  post '/stores', to: 'stores#create'
  
  
end
