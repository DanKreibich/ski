Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'


  get 'contact', to: 'pages#contact', as: :contact
  devise_for :users

  get ':user_id/trips', to: 'trips#new', as: :new_trip

  resources :users, only: [:index, :show, :edit, :update] do
    resources  :trips, only: [:create]
  end

  resources :orders, only: [:show] do
    resources :payments, only: :new
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
