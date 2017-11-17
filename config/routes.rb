Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/signup", to: "users#new", as: :signup
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: :user

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  root :to => 'fights#index'
  get "/fights", to: "fights#index", as: :fights
  post "/fights", to: "fights#create"
  get "/fights/search", to: "fight_cards#search", as: :fights_search
  post "/fights/search", to: "fight_cards#results"
  get "/fights/new", to: "fights#new", as: :new_fight
  get "/fights/:id", to: "fights#show", as: :fight
  delete "/fights/:id", to: "fights#destroy"


  get "/fighters/search", to: "fighter_datum#search", as: :fighters_search
  post "/fighters/search", to: "fighter_datum#results"
  get "/fighters/results", to: "fighter_datum#results", as: :fighters_results
  post "/fighters/results", to: "fighter_datum#results"


  resources :fighters, only: [:index, :new, :create]
  get "/fighters/:id", to: "fighters#show", as: :fighter
  delete "/fighters/:id", to: "fighters#destroy"


end
