Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'  # Or whatever controller/action

  resources :portfolio_items
  resources :resumes, only: [:show]  # Public download, edit behind auth

  namespace :admin do
    resource :resume, only: [:edit, :update]   # singular resource, no :index/:show
    resources :portfolio_items
    root to: "dashboard#index"
  end
end
