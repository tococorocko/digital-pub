Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :games, only: [:index, :show] do
    resources :chats, only: [:index, :show]
  end
  
  resources :user_chats, only: [] do
    resources :messages, only: :create
  end

end
