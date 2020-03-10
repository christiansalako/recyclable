Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :products do
    resources :materials, only: [:new, :create]
    resources :favorites, only: [:create]
    member do
      get :alternatives
    end
  end
  resources :favorites, only: [:destroy]
end
