Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'search', to: 'puppies#search', as: 'search'

  resources :puppies do
    resources :bookings, except: [:index, :edit, :update]
  end
  get 'about', to: 'pages#about', as: 'about'
  get 'profile', to: 'pages#profile', as: 'profile'
  get '/puppies/:puppy_id/bookings/:id/accept', to: 'bookings#accept', as: 'accept_booking'
  get '/puppies/:puppy_id/bookings/:id/reject', to: 'bookings#reject', as: 'reject_booking'
  get 'profile/:id', to: 'pages#user_profile', as: 'user_profile'
end
