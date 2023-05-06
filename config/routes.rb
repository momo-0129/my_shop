Rails.application.routes.draw do
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/new'
  # get 'carts/show'
  devise_for :users
  root 'products#index'
  

  get 'checkout/success', to: 'checkouts#success'
  get 'billing', to: 'billing#show'
  
  resources :products
  resources :orders
  
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
