Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'pages/preferences' => "pages#preferences"

  resources :preferences, only: [:index]
  resources :favorite_teams, only: [:new, :create, :destroy]
  resources :favorite_leagues, only: [:new, :create, :destroy]
end
