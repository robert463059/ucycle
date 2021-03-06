Rails.application.routes.draw do
  

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get '/' => "users#index"

  root 'users#index'

  resources :search, only: [:index]

  post "/search" => "search#search", as: "search"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :users

  resources :postings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
