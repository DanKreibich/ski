Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'


  get 'contact', to: 'pages#contact', as: :contact
  devise_for :users

  get ':user_id/trips', to: 'trips#new', as: :new_trip

  resources :users, only: [:index, :show] do
    resources  :trips, only: :create
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
