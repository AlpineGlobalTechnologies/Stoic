Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'  # Or whatever controller/action

  resources :quotes

  namespace :admin do
    resources :authors
    resources :quotes
    root to: "dashboard#index"
  end
end
