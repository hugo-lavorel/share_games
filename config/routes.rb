Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard/games', to: 'games#list_owned'
  resources :users, only: [:edit, :update, :show]
  resources :games, only: [:index, :new, :create, :show, :update, :edit, :destroy]
end
