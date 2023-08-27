Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/home', to: 'home#index', as: 'home'
  root to: redirect('/home')

  # Defines the root path route ("/")
  # root "articles#index"
  resources :accounts, only: [:new, :create, :index]
  resources :benficaries, only: [:new, :create, :index]
  resources :transfers, only: [:index] do
    member do
      get 'perform'
      post 'transaction'
      get 'history'
    end
  end

end
