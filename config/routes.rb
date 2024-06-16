Rails.application.routes.draw do
# devise_for :users, :controllers => {
#    :registrations => 'users/registrations',
#    :sessions => 'users/sessions'
#  }

devise_for :users, skip: [:sessions]
 as :user do
  get 'signin', to: 'devise/sessions#new', as: :new_user_session
  post 'signin', to: 'devise/sessions#create', as: :user_session
  match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
end

  get "/users", to: "users#new"
  post "/users", to: "users#create"
  delete "/users/:id", to: "users#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: "books#index"
  post "/books", to: "books#create"
  get "/books/new", to: "books#new", as: "new_book"
  get "/books/:id/edit", to: "books#edit", as: "edit_book"
  get "/books/:id", to: "books#show", as: "book"
  patch "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"

  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
