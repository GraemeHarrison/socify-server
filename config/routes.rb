Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'home/front'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Possibly need for Devise - Graeme
  root to: "home#index"
end