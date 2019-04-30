Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#top'
  resources :books
  resources :users
  get 'about', to: 'static_pages#about'
  resources :post_images, only: [:new, :create, :index, :show]


end
