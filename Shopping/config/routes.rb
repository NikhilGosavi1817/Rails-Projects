Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/home', to: 'home#index', as: 'home'
  root to: redirect('/home')

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index]
  # resources :benficaries, only: [:new, :create, :index]
  resources :carts, only: [:index, :show] do
    member do
      get 'perform'
      post 'add'
      patch 'remove'
      patch 'checkout'
    end
  end

end
