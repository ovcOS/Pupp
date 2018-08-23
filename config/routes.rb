Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :puppies do
    resources :bookings, except: [:index, :edit, :update]
  end
  get 'about', to: 'pages#about', as: 'about'
  get 'profile', to: 'pages#profile', as: 'profile'
  get 'puppies/:puppy_id/booking/:id/confirmation', to: 'bookings#confirmation', as: 'puppy_booking_confirmation'
end
