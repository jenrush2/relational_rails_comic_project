Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/stores', to: 'stores#index'
  # Why can't I put line 9 or 10  below line 11? When I do, it thinks new is the store id. Shouldn't it then check the next line instead of throwing an error?
  # Is there a workaround for that? Exact match or something?
  get '/stores/by_books', to: 'stores#sorted_index'
  get '/stores/new', to: 'stores#new'
  get '/stores/:id', to: 'stores#show'
  get '/books', to: 'books#index'
  #same issue where I can't put line 14 before line 13
  get '/books/all', to: 'books#fullindex'
  get '/books/:id', to: 'books#show'
  get '/stores/:store_id/books', to: 'store_books#index'
  post '/stores', to: 'stores#create'
  get '/stores/:store_id/edit', to: 'stores#edit'
  patch '/stores/:store_id', to: 'stores#update'
  get '/stores/:store_id/books/new', to: 'store_books#new'
  post '/stores/:store_id/books', to: 'store_books#create'
  get '/books/:book_id/edit', to: 'books#edit'
  patch '/books/:book_id', to: 'books#update'
  delete '/stores/:store_id', to: 'stores#destroy'
  delete '/books/:book_id', to: 'books#destroy'
  
  
  
end
