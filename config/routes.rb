Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'


  resources :preferences, only: [:index]
  resources :favorite_teams, only: [:new, :create, :destroy]
  resources :favorite_leagues, only: [:new, :create, :destroy]
  resources :games, only: [:index, :show] do
    resources :chats, only: [:index, :show] do
      resources :messages, only: :create
    end
  end


end
