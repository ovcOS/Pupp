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
end
