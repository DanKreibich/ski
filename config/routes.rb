Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'

  resources  :trips, only: [:new, :create]

  get 'contact', to: 'pages#contact', as: :contact
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
