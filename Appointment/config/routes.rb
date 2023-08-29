Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/home', to: 'home#index', as: 'home'
  root to: redirect('/home')

  # Defines the root path route ("/")
  # root "articles#index"
  resources :doctors, only: [:index, :show]
  resources :benficaries, only: [:new, :create, :index]
  resources :appointments, only: [:index] do
    member do
      get 'perform'
      post 'doct'
      get 'history'
    end
  end

end
