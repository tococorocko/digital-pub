Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'pages/about'
  get 'pages/beer'

  resources :preferences, only: [:index]
  resources :favorite_teams, only: [:new, :create, :destroy]
  resources :favorite_leagues, only: [:new, :create, :destroy]
  resources :games, only: [:index, :show] do
    resources :chats, only: [:index, :show] do
      resources :messages, only: :create
    end
  end

  mount ActionCable.server => "/cable"

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
