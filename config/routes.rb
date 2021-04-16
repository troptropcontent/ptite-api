Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :users, only: [:index, :create]
      resources :events, only: [:index, :create, :update, :destroy]
      resources :groups, only: [:index, :create, :update, :destroy]
      get "/users", to: "users#index"

      post "/login", to: "auth#login"
      get "/persist", to: "auth#persist"
      get "/user_is_authed", to: "auth#user_is_authed"
    end
  end


end
